//
//  CardsViewController.swift
//  MyFirstIOSApp
//
//  Created by Paulo Filipe Moreira da Silva on 08/08/23.
//

import UIKit

class CardsViewController: UIViewController {
    
    private var cards: [Card] = []
    
    // Loading
    private let activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Título
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.numberOfLines = 0
        label.text = "Cards de YuGiOH"
        return label
    }()
    
    // Tabela
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //tableView.separatorStyle = .none
        tableView.rowHeight = 136
        return tableView
    }()
    
    // Método chamado quando a view é carregada
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        tableView.dataSource = self
        tableView.delegate = self
        
        addViewInHierarchy()
        setupConstraints()
        fetchRemoteCards()
    }
    
    // Adiciona os elementos na hierarquia de views
    private func addViewInHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
    }
    
    // Configuração das constraints
    private func setupConstraints() {
        // Título
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        // Tabela
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func fetchRemoteCards() {
        activityIndicator.startAnimating()
        
        guard let url = URL(string: "https://db.ygoprodeck.com/api/v7/cardinfo.php?language=pt") else {
            print("Error: Cannot create URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let cardsData = data else {
                print("No data received")
                return
            }
            
            // DEBUG: Print first 10000 characters from received data to terminal
            //            let dataAsString = String(data: cardsData, encoding: .utf8)
            //            print(dataAsString?.prefix(10000) ?? "Data could not be printed")
            // DEBUG: End
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let response = try decoder.decode(RemoteCards.self, from: cardsData)
                self.cards = response.data
                
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.tableView.reloadData()
                }
                
                // DEBUG: Print first card to terminal
                //                print("Remote cards: \(self.cards.count)")
                //                print(self.cards[0])
                // DEBUG: End
                
                
            } catch {
                print("Error decoding data: \(error)")
            }
            
        }
        
        task.resume()
    }
}


extension CardsViewController: UITableViewDataSource, UITableViewDelegate {
    // Configuração das células da tabela
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CardCell()
        let card = cards[indexPath.row]
        cell.configureCell(card: card)
        return cell
    }
    
    // Quantidade de linhas na tabela
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cards.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Detail", bundle: Bundle(for: DetailViewController.self))
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        detailViewController.card = cards[indexPath.row]
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
