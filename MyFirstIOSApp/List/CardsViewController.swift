//
//  CardsViewController.swift
//  MyFirstIOSApp
//
//  Created by Paulo Filipe Moreira da Silva on 08/08/23.
//

import UIKit

class CardsViewController: UIViewController {
    
    // https://i.pinimg.com/474x/29/36/fe/2936feab43fe2be5e7b0cd4c0025658c.jpg
    private var cards: [Card] = [
        .init(name: "Dark Magician", description: "The ultimate wizard in terms of attack and defense.", atk: 2500, def: 2100, imageURL: "https://storage.googleapis.com/ygoprodeck.com/pics/46986414.jpg"),
        .init(name: "Blue-Eyes White Dragon", description: "This legendary dragon is a powerful engine of destruction. This legendary dragon is a powerful engine of destruction. This legendary dragon is a powerful engine of destruction.", atk: 3000, def: 2500, imageURL: "https://storage.googleapis.com/ygoprodeck.com/pics/89631139.jpg"),
        .init(name: "Red-Eyes Black Dragon", description: "A ferocious dragon with a deadly attack.", atk: 2400, def: 2000, imageURL: "https://storage.googleapis.com/ygoprodeck.com/pics/74677422.jpg"),
        .init(name: "Dark Magician", description: "The ultimate wizard in terms of attack and defense.", atk: 2500, def: 2100, imageURL: "https://storage.googleapis.com/ygoprodeck.com/pics/46986414.jpg"),
        .init(name: "Blue-Eyes White Dragon", description: "This legendary dragon is a powerful engine of destruction. This legendary dragon is a powerful engine of destruction. This legendary dragon is a powerful engine of destruction.", atk: 3000, def: 2500, imageURL: "https://storage.googleapis.com/ygoprodeck.com/pics/89631139.jpg"),
        .init(name: "Red-Eyes Black Dragon", description: "A ferocious dragon with a deadly attack.", atk: 2400, def: 2000, imageURL: "https://storage.googleapis.com/ygoprodeck.com/pics/74677422.jpg"),
        .init(name: "Dark Magician", description: "The ultimate wizard in terms of attack and defense.", atk: 2500, def: 2100, imageURL: "https://storage.googleapis.com/ygoprodeck.com/pics/46986414.jpg"),
        .init(name: "Blue-Eyes White Dragon", description: "This legendary dragon is a powerful engine of destruction. This legendary dragon is a powerful engine of destruction. This legendary dragon is a powerful engine of destruction.", atk: 3000, def: 2500, imageURL: "https://storage.googleapis.com/ygoprodeck.com/pics/89631139.jpg"),
        .init(name: "Red-Eyes Black Dragon", description: "A ferocious dragon with a deadly attack.", atk: 2400, def: 2000, imageURL: "https://storage.googleapis.com/ygoprodeck.com/pics/74677422.jpg")
    ]
    
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
        
    }
    
    // Adiciona os elementos na hierarquia de views
    private func addViewInHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
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
