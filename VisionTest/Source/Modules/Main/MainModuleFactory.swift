//
//  MainModuleFactory.swift
//  VisionTest
//
//  Created by Nikita Fomichev on 02.11.2021.
//

import UIKit

struct MainModuleFactory {

    static func createModule() -> UIViewController {
        
        let viewController = MainModuleViewController()
        
        let router = MainModuleRouter(viewController)
        
        let textRecognitionService = ServiceProvider.shared.textRecognitionService
        
        let viewModel = MainModuleViewModel(router: router,
                                            textRecognitionService: textRecognitionService)
        
        viewController.viewModel = viewModel
        
        return viewController
    }
}
