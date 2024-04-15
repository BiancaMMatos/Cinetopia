//
//  MovieTableViewCell.swift
//  Cinetopia
//
//  Created by Bianca Maciel Matos on 15/04/24.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    // MARK:- Properties
    private lazy var moviePosterImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.avatar)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 12
        
        return imageView
    }()
    
    // MARK:- Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) { // igual ao ViewDidLoad
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
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
    }
    
    private func setupConstraints() {
        
    }

}
