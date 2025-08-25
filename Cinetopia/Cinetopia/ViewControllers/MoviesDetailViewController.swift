//
//  MoviesDetailViewController.swift
//  Cinetopia
//
//  Created by Bianca Maciel Matos on 15/04/24.
//

import UIKit
import SnapKit
import Kingfisher

class MoviesDetailViewController: UIViewController {
    
    // MARK:- Properties
    private var movie: Movie
    
    private lazy var movieTitle: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = movie.title
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 30, weight: .bold)
        lbl.textColor = .white
        
        return lbl
    }()
    
    private lazy var posterImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 12
        
        let url = URL(string: movie.image)
        image.kf.setImage(with: url)
        
        return image
    }()
    
    private lazy var userRate: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Classificação dos usuários: \(movie.rate)"
        lbl.font = .systemFont(ofSize: 20, weight: .semibold)
        lbl.numberOfLines = 0
        lbl.textColor = .white
        
        return lbl
    }()
    
    private lazy var synopsisLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = movie.synopsis
        lbl.font = .systemFont(ofSize: 15, weight: .regular)
        lbl.textColor = .white
        lbl.numberOfLines = 0
        
        return lbl
    }()

    // MARK:- Life Cycle
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        
        addSubviews()
        setupConstraints()
    }
    
    
    // MARK:- Functions
    private func addSubviews() {
        view.addSubview(movieTitle)
        view.addSubview(posterImageView)
        view.addSubview(userRate)
        view.addSubview(synopsisLabel)
    }

    private func setupConstraints() {
        /// Movie Title
        movieTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.greaterThanOrEqualToSuperview().offset(32) // Margem superior mínima de 32 pontos
            make.centerY.equalToSuperview().multipliedBy(0.3) // Ajuste da proporção para centralizar verticalmente
            make.bottom.lessThanOrEqualTo(posterImageView.snp.top).offset(-16) // Margem inferior máxima em relação ao posterImageView
            make.leading.greaterThanOrEqualToSuperview().offset(12) // Margem esquerda mínima de 12 pontos
            make.trailing.lessThanOrEqualToSuperview().offset(-12) // Margem direita mínima de 12 pontos
        }
        
        /// Image Poster
        posterImageView.snp.makeConstraints { make in
            make.top.equalTo(movieTitle.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        
        /// User Rate
        userRate.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        /// Synopsis
        synopsisLabel.snp.makeConstraints { make in
            make.top.equalTo(userRate.snp.bottom).offset(36)
            make.leading.equalToSuperview().offset(12) // Margem esquerda mínima de 12 pontos
            make.trailing.equalToSuperview().offset(-12) // Margem direita mínima de 12 pontos
            make.centerX.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview().offset(-32) // Margem inferior máxima
        }
    }


}

#Preview {
    MoviesDetailViewController(movie: mockedMovies[3])
}
