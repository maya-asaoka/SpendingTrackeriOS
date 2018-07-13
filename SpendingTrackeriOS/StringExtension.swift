//
//  StringExtension.swift
//  SpendingTrackeriOS
//
//  Created by Maya Asaoka on 2018-07-13.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

import Foundation

extension String {

    // check if string is a valid dollar amount
    var isValidAmount : Bool {
        let currencyFormat = "\\d\\*\\(\\.\\d\\d\\?\\)\\?"
        let currencyPredicate = NSPredicate(format: "SELF MATCHES %@", currencyFormat)
        return currencyPredicate.evaluate(with: self)
    }
    
}
