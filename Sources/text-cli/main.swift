import Foundation
import ArgumentParser
import Vision
import AppKit

public enum Errors: Error {
    case notFound
    case invalidImage
    case cgImage
    case processError
    case unsupportedOS
}

@available(macOS 10.15, *)
struct TextExtractCLI: ParsableCommand {

    @Argument(help:"The path to an image file to extract text from")
    var inputFile: String
    
    func processImage(image: CGImage) -> Result<String, Error> {
                
        let req = VNRecognizeTextRequest()
        let handler = VNImageRequestHandler(cgImage: image, options: [:])

        do {
            try handler.perform([req])
        } catch {
            return .failure(error)
        }
        
        var transcript = ""

        if req.results != nil {
            
            let maximumCandidates = 1
            for observation in req.results! {
                guard let candidate = observation.topCandidates(maximumCandidates).first else { continue }
                transcript += candidate.string
                transcript += "\n"
            }
        }

        transcript = transcript.trimmingCharacters(in: .whitespacesAndNewlines)
        return .success(transcript)
    }
    
    func run() throws {
        
        let fm = FileManager.default
        
        if (!fm.fileExists(atPath: inputFile)){
            throw(Errors.notFound)
        }
        
        guard let im = NSImage(byReferencingFile:inputFile) else {
            throw(Errors.invalidImage)
        }
        
        guard let cgImage = im.cgImage(forProposedRect: nil, context: nil, hints: nil) else {
            throw(Errors.cgImage)
        }
        
        let rsp = processImage(image: cgImage)
        
        switch rsp {
        case .failure(let error):
            throw(error)
        case .success(let txt):
            print(txt)
        }
        
    }
}

if #available(macOS 10.15, *) {
    TextExtractCLI.main()
} else {
    throw(Errors.unsupportedOS)
}
