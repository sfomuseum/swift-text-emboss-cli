import Foundation
import ArgumentParser
import AppKit
import TextEmboss

public enum Errors: Error {
    case notFound
    case invalidImage
    case cgImage
    case processError
    case unsupportedOS
}

@available(macOS 10.15, *)
struct TextExtractCLI: ParsableCommand {

    @Argument(help:"The path to an image file to extract text from  ")
    var inputFile: String
    
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
        
        let te = TextEmboss()
        let rsp = te.ProcessImage(image: cgImage)
        
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
