//
//  Card.swift
//  MyFirstIOSApp


struct YuGiOhResonse: Decodable {
    struct Card: Decodable {
        let name: String
        let desc: String
        let atk: Int?
        let imageUrl: String?
        let def: Int?
        let type: String
        let level: Int?
    }

    let data: [Card]
}
