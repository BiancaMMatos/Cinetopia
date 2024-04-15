//
//  MoviesViewController.swift
//  Cinetopia
//
//  Created by Bianca Maciel Matos on 12/04/24.
//

import UIKit

class MoviesViewController: UIViewController {

    var names: [String] = [
        "Bianca", "Felipe", "Fran", "Bruno"
    ]
    
    // MARK:- Properties
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear /// limpando o fundo, garantindo o fundo com a cor .background ao invés de branco
        tableView.dataSource = self /// a tela é a fonte de dados para a célula
        tableView.delegate = self ///  comportamento da tabela será conforme esta tela
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "nameCell") /// adicionando identificador
        return tableView
    }()
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        addSubviews()
        setupConstraints()
        setupNavigationBar()
    }
    
    // MARK:- Functions
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setupNavigationBar() {
        title = "Filmes populares"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        navigationItem.setHidesBackButton(true, animated: true)
    }

}

extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { /// retorna a quantidade de linhas que a tabela terá
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { /// retorna as característica das células
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
        //cell.textLabel?.text = names[indexPath.row]
        var configuration = cell.defaultContentConfiguration()
        configuration.textProperties.color = .white
        configuration.text = names[indexPath.row]
        cell.contentConfiguration = configuration
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { /// seleciono uma célula
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
