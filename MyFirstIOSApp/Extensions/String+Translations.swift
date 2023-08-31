//
//  String+Translations.swift
//  MyFirstIOSApp
//
//  Created by Paulo Filipe Moreira da Silva on 31/08/23.
//

import Foundation

extension String {
  func localized() -> String {
    
      return NSLocalizedString(self,
                               tableName: "Localizable",
                               bundle: .main,
                               value: self,
                               comment: self)
  }

}
