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

//        // Do any additional setup after loading the view.
        cardDescription.text = card.description
//        cardDef.text = String(card.def)
        cardDef.text = "DEF \(card.def)"
        cardAtk.text = "ATK \(card.atk)"
//        cardLevel.text = String(card.level)
//        //cardType.text = card.type
        cardName.text = card.name
    
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
