//
//  DetailViewController.swift
//  MyFirstIOSApp
//
//  Created by Paulo Filipe Moreira da Silva on 15/08/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardName: UILabel!
    @IBOutlet weak var cardType: UILabel!
    @IBOutlet weak var cardLevel: UILabel!
    @IBOutlet weak var cardAtk: UILabel!
    @IBOutlet weak var cardDef: UILabel!
    @IBOutlet weak var cardDescription: UILabel!
    
    var card: Card!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        populateDetailScreen(with: card)
    }
    
    func populateDetailScreen(with card: Card){
        cardDescription.text = card.desc ?? ""
        
        // DEF
        if let def = card.def {
            cardDef.text = "DEF \(def)"
        } else {
            cardDef.text = ""
        }
        // ATK
        if let atk = card.atk {
            cardAtk.text = "ATK \(atk)"
        } else {
            cardAtk.text = ""
        }
        // LVL
        if let level = card.level {
            cardLevel.text = "LEVEL \(level)"
        } else {
            cardLevel.text = ""
        }
        // Type and Name
        cardType.text = card.type
        cardName.text = card.name
        
        //Image
        cardImage.download(path: card.cardImages?.first?.imageUrlCropped ?? "")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
