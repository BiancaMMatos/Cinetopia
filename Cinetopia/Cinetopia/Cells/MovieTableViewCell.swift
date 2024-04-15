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
        let imageView = UIImageView(image: UIImage.avatar)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 12
        
        return imageView
    }()
    
    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Avatar"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var movieReleaseDateLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lançamento: 18/12/2009"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white.withAlphaComponent(0.75)
        
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
        }
        
        /// Title label
        movieTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(moviePosterImageView.snp.centerY)
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
