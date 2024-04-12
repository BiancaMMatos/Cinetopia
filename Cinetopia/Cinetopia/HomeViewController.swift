//
//  HomeViewController.swift
//  Cinetopia
//
//  Created by Bianca Maciel Matos on 07/04/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.logo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var coupleImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.couple)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // vamos utilizar constraints programáticas
        label.text = "O lugar ideal para buscar, salvar e organizar seus filmes favoritos!"
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        
        addSubviews()
        setupConstraints()
        
    }


    
    // MARK: - Functions
    private func addSubviews() {
        view.addSubview(logoImageView)
        view.addSubview(coupleImageView)
        view.addSubview(welcomeLabel)
    }
    
    private func setupConstraints() {
        
        /// Logo Image
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(84)
            make.centerX.equalToSuperview()
        }
        
        /// Couple Image
        coupleImageView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
        }
        
        /// Label
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(coupleImageView.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
    }
}
