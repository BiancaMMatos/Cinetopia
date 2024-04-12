//
//  MoviesViewController.swift
//  Cinetopia
//
//  Created by Bianca Maciel Matos on 12/04/24.
//

import UIKit

class MoviesViewController: UIViewController {

    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        setupNavigationBar()
    }
    
    // MARK:- Functions
    private func setupNavigationBar() {
        title = "Filmes populares"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        navigationItem.setHidesBackButton(true, animated: true)
    }

}
