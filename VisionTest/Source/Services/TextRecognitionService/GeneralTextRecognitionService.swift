//
//  GeneralTextRecognitionService.swift
//  VisionTest
//
//  Created by Nikita Fomichev on 02.11.2021.
//

import UIKit
import Vision

typealias TextRecognitionResult = (image: UIImage, text: String)

final class GeneralTextRecognitionService: TextRecognitionService {
    
    func recognizeText(from image: UIImage, completion: @escaping (TextRecognitionResult) -> Void) {
        guard let cgImage = image.cgImage else {
            completion(TextRecognitionResult(image: image, text: R.Text.RecognitionError.brokenImage))
            return
        }
        
        let vnImageRequestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        
        let request = VNRecognizeTextRequest { request, error in
            guard let recognizedTextObservations = request.results as? [VNRecognizedTextObservation],
                  error == nil else {
                      completion(TextRecognitionResult(image: image, text: error?.localizedDescription ?? R.Text.RecognitionError.brokenError))
                      return
                  }
            
            let recognizedText = recognizedTextObservations.compactMap { $0.topCandidates(1).first?.string }
                .joined(separator: ",")
            
            completion(TextRecognitionResult(image: image, text: recognizedText))
        }
        
        do {
            try vnImageRequestHandler.perform([request])
        }
        catch {
            completion(TextRecognitionResult(image: image, text: error.localizedDescription))
        }
    }
    
}
