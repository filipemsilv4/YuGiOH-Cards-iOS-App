//
//  DetailViewController.swift
//  MyFirstIOSApp
//
//  Created by Paulo Filipe Moreira da Silva on 15/08/23.
//

import UIKit

class DetailViewController: UIViewController {

    var card: YuGiOhResonse.Card!
    private let cardImageView = UIImageView()
    private let nameLabel = UILabel()
    private let typeLabel = UILabel()
    private let levelLabel = UILabel()
    private let atkLabel = UILabel()
    private let defLabel = UILabel()
    private let descriptionLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        populateUI()
    }

    private func setupUI() {
        title = card.name
        view.backgroundColor = .systemBackground
        setupImageView()
        setupLabels()
    }

    private func setupImageView() {
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.backgroundColor = .systemGray
        view.addSubview(cardImageView)

        NSLayoutConstraint.activate([
            cardImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.widthAnchor.constraint(equalToConstant: 120),
            cardImageView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }

    private func setupLabels() {
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        typeLabel.textColor = .systemGray
        levelLabel.textColor = .systemGray
        atkLabel.textColor = .systemGray
        defLabel.textColor = .systemGray
        descriptionLabel.numberOfLines = 0

        let stackView = UIStackView(arrangedSubviews: [nameLabel, typeLabel, levelLabel, atkLabel, defLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }

    private func populateUI() {
        nameLabel.text = card.name
        typeLabel.text = "Type: \(card.type)"
        if let level = card.level {
            levelLabel.text = "Level: \(level)"
        }
        if let atk = card.atk {
            atkLabel.text = "ATK: \(atk)"
        }
        if let def = card.def {
            defLabel.text = "DEF: \(def)"
        }
        descriptionLabel.text = card.desc
            
            if let imageUrl = card.imageUrl {
                if let imageData = try? Data(contentsOf: URL(string: imageUrl)!) {
                    cardImageView.image = UIImage(data: imageData)
                }
            }
        }
    }
