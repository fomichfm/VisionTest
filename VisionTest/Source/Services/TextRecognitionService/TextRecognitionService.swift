//
//  TextRecognitionService.swift
//  VisionTest
//
//  Created by Nikita Fomichev on 02.11.2021.
//

import UIKit

protocol TextRecognitionService {
    
    func recognizeText(from image: UIImage, completion: @escaping (TextRecognitionResult) -> Void)
    
}
