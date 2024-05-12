//
//  FavoriteMovieCollectionViewCell.swift
//  Cinetopia
//
//  Created by Bianca Maciel Matos on 12/05/24.
//

import UIKit
import SnapKit

class FavoriteMovieCollectionViewCell: UIViewController {
    
    // MARK: - UI Components
    private let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        
        setupConstraints()

    }
    
    // MARK: - Class methods
    private func setupConstraints() {
        view.addSubview(mainView)
        
        mainView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(mainView.snp.width).multipliedBy(1.6)
        }
    }

}

#Preview {
    FavoriteMovieCollectionViewCell()
}
