//
//  CardsViewController.swift
//  MyFirstIOSApp
//
//  Created by Paulo Filipe Moreira da Silva on 08/08/23.
//

import UIKit

class CardsViewController: UIViewController {
    
    private var cards: [Card] = []
    private var filteredCards: [Card] = []
    
    let searchController = UISearchController(searchResultsController: nil)
    
    // Title and search bar
    override var navigationItem: UINavigationItem {
        let navigationItem = UINavigationItem()
        navigationItem.searchController = searchController
        navigationItem.title = "Cards de YuGiOH"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: nil, action: nil)
                
        return navigationItem
    }
    
    // Search bar
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    
    // Loading
    private let activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Table
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 136
        return tableView
    }()
    
    // Filter cards by name
    func filterContentForSearchText(_ searchText: String) {
        if searchText.isEmpty {
            filteredCards = cards
        } else {
            filteredCards = cards.filter { (card: Card) -> Bool in
                return card.name.lowercased().contains(searchText.lowercased())
            }
        }
        tableView.reloadData()
    }
    
    // This method is called when the view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Cards"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        addViewInHierarchy()
        setupConstraints()
        fetchRemoteCards()
    }
    
    // Add elements to view hierarchy
    private func addViewInHierarchy() {
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
    }
    
    // Constraints configuration
    private func setupConstraints() {
        // Table constraints
        NSLayoutConstraint.activate([
            //tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
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
    // Table cell configuration
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CardCell()
        
        if isFiltering {
            cell.configureCell(card: filteredCards[indexPath.row])
        } else {
            cell.configureCell(card: cards[indexPath.row])
        }
        
        return cell
    }
    
    // Number of rows in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredCards.count
        }
        return cards.count
    }
    
    // When a cell is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Detail", bundle: Bundle(for: DetailViewController.self))
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        if isFiltering {
            detailViewController.card = filteredCards[indexPath.row]
        } else {
            detailViewController.card = cards[indexPath.row]
        }
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension CardsViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
      let searchBar = searchController.searchBar
      filterContentForSearchText(searchBar.text!)
  }
}


// I hope it works
