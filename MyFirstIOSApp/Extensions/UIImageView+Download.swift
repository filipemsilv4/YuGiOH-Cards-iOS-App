//
//  UIImageView+Download.swift
//  MyFirstIOSApp
//
//  Created by Paulo Filipe Moreira da Silva on 28/08/23.
//

import UIKit

extension UIImageView {
    func download(path: String, animationDuration: Double = 1.5) {
        guard let imageUrl = URL(string: path) else { print("Invalid URL"); return }
        
        let task = URLSession.shared.dataTask(with: .init(url: imageUrl)) { data, response, error in
            if let error = error {
                print("Error fetching image: \(error)")
                return
            }
            
            guard let data else {
                print("No data received")
                return
            }
                        
            DispatchQueue.main.async {
                //self.image = UIImage(data: data)
                UIView.transition(with: self,
                                  duration: animationDuration,
                    options: .transitionCrossDissolve,
                    animations: {
                        self.image = UIImage(data: data)
                    }, completion: nil)
            }
        }
        task.resume()
    }
}
