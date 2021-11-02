//
//  MainModuleViewController.swift
//  VisionTest
//
//  Created by Nikita Fomichev on 02.11.2021.
//

import UIKit

private struct Constants {
    static let photoSelectionButtonWidth: CGFloat = 242.0
    static let photoSelectionButtonHeight: CGFloat = 72.0
    static let photoSelectionButtonBottomInset: CGFloat = 52.0
    
    static let loaderSize: CGSize = CGSize(width: 128.0, height: 128.0)
}

class MainModuleViewController: UIViewController {
    
    var viewModel: MainModuleViewModel!
    
    // MARK: - Views
    
    private lazy var photoSelectionButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(openCamera), for: .touchUpInside)
        button.setTitle(R.Text.MainModule.photoButton, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = .black
        return button
    }()
    
    private lazy var loaderView: UIActivityIndicatorView = {
        let loadingView = UIActivityIndicatorView()
        loadingView.hidesWhenStopped = true
        loadingView.style = .large
        loadingView.backgroundColor = .black
        loadingView.color = .white
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        
        return loadingView
    }()
    
    private lazy var imagePickerController: UIImagePickerController = {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .camera
        
        return imagePickerController
    }()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        bindViewModel()
        startViewModel()
    }
    
}

// MARK: - ViewModel binding

private extension MainModuleViewController {
    
    func bindViewModel() {
        viewModel.onRecognitionFinished = { [weak self] in
            self?.stopLoading()
        }
    }
    
    func startViewModel() {
        viewModel.start()
    }
    
}

// MARK: - Configuration

private extension MainModuleViewController {
    
    func configure() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(photoSelectionButton)
        view.addSubview(loaderView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            photoSelectionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photoSelectionButton.widthAnchor.constraint(equalToConstant: Constants.photoSelectionButtonWidth),
            photoSelectionButton.heightAnchor.constraint(equalToConstant: Constants.photoSelectionButtonHeight),
            photoSelectionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.photoSelectionButtonBottomInset),
            
            loaderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loaderView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loaderView.widthAnchor.constraint(equalToConstant: Constants.loaderSize.width),
            loaderView.heightAnchor.constraint(equalToConstant: Constants.loaderSize.height)
        ])
    }
}

// MARK: - Helper methods

private extension MainModuleViewController {
    
    @objc func openCamera() {
        present(imagePickerController, animated: true)
    }
    
    func startLoading() {
        loaderView.startAnimating()
    }
    
    func stopLoading() {
        loaderView.stopAnimating()
    }
    
}


// MARK: - UIImagePickerControllerDelegate

extension MainModuleViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            picker.dismiss(animated: true)
            return
        }

        startLoading()
        picker.dismiss(animated: true)
        viewModel.recognizeText(for: image)
    }

}
