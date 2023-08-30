//
//  CardColor.swift
//  MyFirstIOSApp
//
//  Created by Paulo Filipe Moreira da Silva on 28/08/23.
//

import UIKit

// Since it takes some time to download the image, i wanted to make the user experience smoother by showing the placeholder in the color of the card type, so I can apply a fading effect when the image is downloaded and the placeholder is replaced. No pop-in effect.
func findCardBackgroundColor(type: String) -> UIColor {
    // I know this is ugly, but right now I don't know a better way to do this. I'll try to find a better way later.
    switch type {
        case "Spell Card":
            return UIColor(red: 2.0 / 255.0, green: 125.0 / 255.0, blue: 105.0 / 255.0, alpha: 1.0)
        case "Trap Card":
            return UIColor(red: 150.0 / 255.0, green: 45.0 / 255.0, blue: 110.0 / 255.0, alpha: 1.0)
        case "Effect Monster":
            return UIColor(red: 165.0 / 255.0, green: 90.0 / 255.0, blue: 55.0 / 255.0, alpha: 1.0)
        case "Fusion Monster":
            return UIColor(red: 125.0 / 255.0, green: 70.0 / 255.0, blue: 145.0 / 255.0, alpha: 1.0)
        case "Pendulum Effect Fusion Monster":
            return UIColor(red: 125.0 / 255.0, green: 70.0 / 255.0, blue: 145.0 / 255.0, alpha: 1.0)
        case "Link Monster":
            return UIColor(red: 50.0 / 255.0, green: 115.0 / 255.0, blue: 180.0 / 255.0, alpha: 1.0)
        case "Pendulum Effect Ritual Monster":
            // 90 120 180
            return UIColor(red: 90.0 / 255.0, green: 120.0 / 255.0, blue: 180.0 / 255.0, alpha: 1.0)
        case "Ritual Effect Monster":
            // 100 130 180
            return UIColor(red: 100.0 / 255.0, green: 130.0 / 255.0, blue: 180.0 / 255.0, alpha: 1.0)
        case "Ritual Monster":
            return UIColor(red: 100.0 / 255.0, green: 130.0 / 255.0, blue: 180.0 / 255.0, alpha: 1.0)
        case "Synchro Monster":
            // 220 220 220
            return UIColor(red: 220.0 / 255.0, green: 220.0 / 255.0, blue: 220.0 / 255.0, alpha: 1.0)
        case "Synchro Pendulum Effect Monster":
            // 220 220 220
            return UIColor(red: 220.0 / 255.0, green: 220.0 / 255.0, blue: 220.0 / 255.0, alpha: 1.0)
        case "Synchro Tuner Monster":
            // 220 220 220
            return UIColor(red: 220.0 / 255.0, green: 220.0 / 255.0, blue: 220.0 / 255.0, alpha: 1.0)
        case "XYZ Monster":
            // 10 10 15
            return UIColor(red: 10.0 / 255.0, green: 10.0 / 255.0, blue: 15.0 / 255.0, alpha: 1.0)
        case "XYZ Pendulum Effect Monster":
            // 80 100 100
            return UIColor(red: 80.0 / 255.0, green: 100.0 / 255.0, blue: 100.0 / 255.0, alpha: 1.0)
        case "Skill Card":
            // 45 100 150
            return UIColor(red: 45.0 / 255.0, green: 100.0 / 255.0, blue: 150.0 / 255.0, alpha: 1.0)
        case "Token":
            // 133 133 133
            return UIColor(red: 133.0 / 255.0, green: 133.0 / 255.0, blue: 133.0 / 255.0, alpha: 1.0)
            
        default:
            return UIColor(red: 200.0 / 255.0, green: 135.0 / 255.0, blue: 90.0 / 255.0, alpha: 1.0)
    }
}
