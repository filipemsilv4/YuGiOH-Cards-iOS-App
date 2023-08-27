//
//  CardCell.swift
//  MyFirstIOSApp
//
//  Created by Paulo Filipe Moreira da Silva on 14/08/23.
//

import UIKit

class CardCell: UITableViewCell {
    private let horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 15
        return stack
    }()
    
    private let cardImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 4
        image.layer.masksToBounds = true
        image.backgroundColor = .systemGray
        return image
    }()
    
    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()
    
    private let cardName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.numberOfLines = 1
        return label
    }()
    
    private let cardDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 3
        return label
    }()
    
    private let cardAtk: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 1
        return label
    }()
    
    private let cardDef: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContentView()
        addViewsInHierarchy()
        setupConstraints()
    
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        return nil
    }
    
    func configureCell(card: Card) {
        cardName.text = card.name
        cardDescription.text = card.description ?? ""
        if let atk = card.atk {
            cardAtk.text = "ATK: \(atk)"
        } else {
            cardAtk.text = ""
        }
        if let def = card.def {
            cardDef.text = "DEF: \(def)"
        } else {
            cardDef.text = ""
        }
        
    }
    
    private func setupContentView() {
        selectionStyle = .none
        
    }
    
    private func addViewsInHierarchy() {
        contentView.addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(cardImage)
        horizontalStack.addArrangedSubview(verticalStack)
        verticalStack.addArrangedSubview(cardName)
        verticalStack.addArrangedSubview(cardDescription)
        verticalStack.addArrangedSubview(cardAtk)
        verticalStack.addArrangedSubview(cardDef)
    
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            horizontalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            horizontalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            horizontalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            cardImage.widthAnchor.constraint(equalToConstant: 80),
            cardImage.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
}
