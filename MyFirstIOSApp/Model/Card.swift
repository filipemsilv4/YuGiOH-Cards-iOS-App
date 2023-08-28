//
//  Card.swift
//  MyFirstIOSApp
//
//  Created by Paulo Filipe Moreira da Silva on 09/08/23.
//

struct Card: Decodable {
    let name: String
    let type: String
    let desc: String?
    let atk: Int?
    let def: Int?
    let level: Int?
    let cardImages: [CardImages]?
    
    struct CardImages: Decodable {
        let imageUrl: String?
        let imageUrlCropped: String?
    }
}
