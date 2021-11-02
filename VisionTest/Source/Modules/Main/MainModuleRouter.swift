//
//  MainModuleRouter.swift
//  VisionTest
//
//  Created by Nikita Fomichev on 02.11.2021.
//

import UIKit

final class MainModuleRouter {
    
    //MARK: - Properties
    
    unowned let viewController: UIViewController

    //MARK: - Initialization
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }

    //MARK: - Methods
    
    func openDescriptionController(with textRecognitionResult: TextRecognitionResult) {
        let descriptionViewController = DescriptionModuleFactory.createModule(with: textRecognitionResult)
        viewController.present(descriptionViewController, animated: true)
    }
    
}
