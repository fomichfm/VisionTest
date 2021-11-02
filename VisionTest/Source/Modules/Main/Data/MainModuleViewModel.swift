//
//  MainModuleViewModel.swift
//  VisionTest
//
//  Created by Nikita Fomichev on 02.11.2021.
//

import UIKit

final class MainModuleViewModel {
    
    private let router: MainModuleRouter
    
    private let textRecognitionService: TextRecognitionService
    
    var onRecognitionFinished: (() -> ())?
    
    init(router: MainModuleRouter,
         textRecognitionService: TextRecognitionService) {
        self.router = router
        self.textRecognitionService = textRecognitionService
    }
    
}

extension MainModuleViewModel {
    
    func start() {
        
    }
    
    func recognizeText(for image: UIImage) {
        textRecognitionService.recognizeText(from: image) { [weak self] textRecognitionResult in
            print(textRecognitionResult)
            DispatchQueue.main.async {
                self?.onRecognitionFinished?()
                self?.router.openDescriptionController(with: textRecognitionResult)
            }
        }
    }
    
}
