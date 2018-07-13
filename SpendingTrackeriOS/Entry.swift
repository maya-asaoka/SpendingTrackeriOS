//
//  Entry.swift
//  SpendingTrackeriOS
//
//  Created by Maya Asaoka on 2018-07-09.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

// entry with description, amount, date, and a category

import Foundation

class Entry {
    
    var desc = ""
    var amount = 0.00
    var date = ""
    var category = ""
    
    init(desc: String, amount: Double, date: String, category: String) {
        self.desc = desc
        self.amount = amount
        self.date = date
        self.category = category
    }
    
    
}
