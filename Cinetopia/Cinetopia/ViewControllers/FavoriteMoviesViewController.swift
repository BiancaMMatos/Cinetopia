//
//  FavoriteMoviesViewController.swift
//  Cinetopia
//
//  Created by Bianca Maciel Matos on 12/05/24.
//

import UIKit
import SnapKit

class FavoriteMoviesViewController: UIViewController {

    // MARK: UI Components
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .yellow
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        setupConstraints()
    }
    
    // MARK: Class methods
    private func setupConstraints() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview() // Centralizar na tela
            make.width.equalToSuperview().multipliedBy(0.9) // Largura igual a 90% da largura da tela
            make.height.equalTo(collectionView.snp.width)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(16) // Margem superior em relação ao safeArea
        }
    }


}

#Preview {
    FavoriteMoviesViewController()
}
