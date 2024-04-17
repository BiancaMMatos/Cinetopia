//
//  MoviesViewController.swift
//  Cinetopia
//
//  Created by Bianca Maciel Matos on 12/04/24.
//

import UIKit

class MoviesViewController: UIViewController {
    
    // MARK:- Properties
    private var filteredMovies: [Movie] = []
    private var isSearchActive: Bool = false
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear /// limpando o fundo, garantindo o fundo com a cor .background ao invés de branco
        tableView.dataSource = self /// a tela é a fonte de dados para a célula
        tableView.delegate = self ///  comportamento da tabela será conforme esta tela
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "movieCell") /// adicionando identificador
        return tableView
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Pesquisar"
        searchBar.searchTextField.backgroundColor = .white
        searchBar.delegate = self
        
        return searchBar
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
        navigationItem.titleView = searchBar
    }

}

extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { /// retorna a quantidade de linhas que a tabela terá
        return isSearchActive ? filteredMovies.count : movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { /// retorna as característica das células
        if let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell {
            let movie = isSearchActive ? filteredMovies[indexPath.row] : movies[indexPath.row] /// verificação para célula
            cell.configureCell(movie: movie)
            cell.selectionStyle = .none // para remover efeito de clique na célula
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { /// seleciono uma célula
        tableView.deselectRow(at: indexPath, animated: true)
        let movie = isSearchActive ? filteredMovies[indexPath.row] : movies[indexPath.row] /// verificando qual lista deverá ser apresentada
        let detailsVC = MoviesDetailViewController(movie: movie)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { /// a altura da célula
        return 160
    }
}

extension MoviesViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) { /// avisa quando o texto da searchBar for alterada
        isSearchActive = searchText.isEmpty ? false : true
        if isSearchActive {
            filteredMovies = movies.filter({ movie in
                movie.title.lowercased().contains(searchText.lowercased()) /// verificando se o título no filme corresponde ao que o usuário está pesquisando
            })
        }
        tableView.reloadData() // recarregando tela
    }
    
}
