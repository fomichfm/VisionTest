//
//  DescriptionModuleFactory.swift
//  VisionTest
//
//  Created by Nikita Fomichev on 02.11.2021.
//

import UIKit

struct DescriptionModuleFactory {

    static func createModule(with textRecognitionResult: TextRecognitionResult) -> UIViewController {
        
        let viewController = DescriptionModuleViewController()
        
        let viewModel = DescriptionModuleViewModel(textRecognitionResult: textRecognitionResult)
        
        viewController.viewModel = viewModel
        
        return viewController
    }
    
}
