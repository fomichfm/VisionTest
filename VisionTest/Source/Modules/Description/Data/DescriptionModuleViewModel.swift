//
//  DescriptionModuleViewModel.swift
//  VisionTest
//
//  Created by Nikita Fomichev on 02.11.2021.
//

final class DescriptionModuleViewModel {
    
    var onConfigurationReady: ((TextRecognitionResult) -> ())?
    
    private let textRecognitionResult: TextRecognitionResult
    
    init(textRecognitionResult: TextRecognitionResult) {
        self.textRecognitionResult = textRecognitionResult
    }
    
}

extension DescriptionModuleViewModel {
    
    func start() {
        onConfigurationReady?(textRecognitionResult)
    }
}
