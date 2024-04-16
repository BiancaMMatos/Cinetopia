//
//  MovieTableViewCell.swift
//  Cinetopia
//
//  Created by Bianca Maciel Matos on 15/04/24.
//

import UIKit
import SnapKit

class MovieTableViewCell: UITableViewCell {
    
    // MARK:- Properties
    private lazy var moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 12
        
        return imageView
    }()
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var movieReleaseDateLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white.withAlphaComponent(0.75)
        label.numberOfLines = 0
        
        return label
    }()
    
    
    // MARK:- Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) { // igual ao ViewDidLoad
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
        backgroundColor = .background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    // MARK:- Functions
    func configureCell(movie: Movie) {
        movieTitleLabel.text = movie.title
        moviePosterImageView.image = UIImage(named: movie.image)
        movieReleaseDateLabel.text = "Lançamento: \(movie.releaseDate)"
    }
    
    
    private func addSubviews() {
        addSubview(moviePosterImageView)
        addSubview(movieTitleLabel)
        addSubview(movieReleaseDateLabel)
    }
    
    private func setupConstraints() {
        /// Poster
        moviePosterImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.width.equalToSuperview().multipliedBy(0.3) // largura relativa
            
            // Adicionando constraint para manter a proporção da imagem
            make.height.equalTo(moviePosterImageView.snp.width).multipliedBy(1.5)
        }
        
        /// Title label
        movieTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(moviePosterImageView.snp.centerY).offset(-16)
            make.leading.equalTo(moviePosterImageView.snp.trailing).offset(16)
        }
        
        /// Movie Release
        movieReleaseDateLabel.snp.makeConstraints { make in
            make.top.equalTo(movieTitleLabel.snp.bottom).offset(8) // Distância entre o título e a data de lançamento
            make.leading.equalTo(moviePosterImageView.snp.trailing).offset(16)
            make.trailing.lessThanOrEqualToSuperview().offset(-16) // Garante que o texto completo seja visível
            make.bottom.lessThanOrEqualToSuperview().offset(-16) // Garante que a data não ultrapasse a parte inferior da tela
        }
    }
    
}

#Preview {
    MovieTableViewCell()
}
