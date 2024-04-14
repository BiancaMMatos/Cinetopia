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
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var coupleImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.couple)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
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
    
    private lazy var welcomeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Quero começar!", for: .normal)
        button.backgroundColor = .buttonBackground
        button.setTitleColor(.background, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 32
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [logoImageView, coupleImageView, welcomeLabel, welcomeButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.alignment = .center
        return stackView
    }()
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        
        addSubviews()
        setupConstraints()
        
        
    }
    
    // MARK: - Functions
    @objc private func buttonPressed() {
        navigationController?.pushViewController(MoviesViewController(), animated: true)
    }
    
    
    private func addSubviews() {
        view.addSubview(stackView)
    }
    
    private func setupConstraints() {
        
        stackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin) // Alinha ao topo da safeArea
        }
        
        welcomeButton.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(52)
            make.leading.equalTo(stackView.snp.leading).offset(46)
            make.trailing.equalTo(stackView.snp.trailing).offset(-46)
            make.height.equalTo(64) // para a altura do botão
             
        }
        
    }
}
