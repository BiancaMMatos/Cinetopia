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
    var label: UILabel = {
        let label = UILabel()
        label.text = "Hello, World!"
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        
        configureLabel()
        
    }


    
    // MARK: - Functions
    private func configureLabel() {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false // vamos utilizar constraints programáticas
        
        label.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview() // centralizando label
        }
        
    }
}
