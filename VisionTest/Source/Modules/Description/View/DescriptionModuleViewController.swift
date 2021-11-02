//
//  DescriptionModuleViewController.swift
//  VisionTest
//
//  Created by Nikita Fomichev on 02.11.2021.
//

import UIKit

private struct Constants {
    static let imageViewHeight: CGFloat = 520.0
    
    static let textToImageInset: CGFloat = 52.0
    static let textLeftRightPadding: CGFloat = 32.0
    static let textBottomPadding: CGFloat = 52.0
}

class DescriptionModuleViewController: UIViewController {
    
    var viewModel: DescriptionModuleViewModel!
    
    // MARK: - Views
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = R.Font.medium(17)
        label.textColor = .white
        label.backgroundColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
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

private extension DescriptionModuleViewController {
    
    func bindViewModel() {
        viewModel.onConfigurationReady = { [weak self] viewConfiguration in
            self?.imageView.image = viewConfiguration.image
            self?.textLabel.text = viewConfiguration.text
        }
    }
    
    func startViewModel() {
        viewModel.start()
    }
    
}

// MARK: - Configuration

private extension DescriptionModuleViewController {
    
    func configure() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.backgroundColor = .black
        
        view.addSubview(textLabel)
        view.addSubview(imageView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: Constants.imageViewHeight),
            
            textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constants.textToImageInset),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.textLeftRightPadding),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.textLeftRightPadding),
            textLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.textBottomPadding)
        ])
    }
}
