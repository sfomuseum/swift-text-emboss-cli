import Foundation
import ArgumentParser
import Vision
import AppKit

@available(macOS 10.15, *)
struct TextExtractCLI: ParsableCommand {

    @Argument(help:"...")
    var inputFile: String
    
    func processImage(image: CGImage) {
                
        let textRecognitionRequest = VNRecognizeTextRequest()
        let handler = VNImageRequestHandler(cgImage: image, options: [:])

        do {
            try handler.perform([textRecognitionRequest])
        } catch {
            print(error)
        }
    }
    
    func run() {
        
        let fm = FileManager.default
        
        if (!fm.fileExists(atPath: inputFile)){
            print("File does not exist")
            return
        }
        
        guard let im = NSImage(byReferencingFile:inputFile) else {
            print("SAD IMAGE")
            return
        }
        
        print("WUB \(inputFile) \(im)")
    }
}

if #available(macOS 10.15, *) {
    
    TextExtractCLI.main()
    exit(0)
    
} else {
    print("SAD")
    exit(1)
}
