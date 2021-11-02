//
//  ServiceProvider.swift
//  VisionTest
//
//  Created by Nikita Fomichev on 02.11.2021.
//

final class ServiceProvider {
    
    static let shared = ServiceProvider()
    
    private(set) lazy var textRecognitionService: TextRecognitionService = {
        return GeneralTextRecognitionService()
    }()
    
}
