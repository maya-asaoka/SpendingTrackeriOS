//
//  RemoveEntryController.swift
//  SpendingTrackeriOS
//
//  Created by Maya Asaoka on 2018-07-11.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

import UIKit

class RemoveEntryController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Arrays.entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "singleEntry2", for: indexPath) as! ViewControllerTableViewCell
        
        let entry = Arrays.entries[indexPath.row]
        
        cell.desc2.text = entry.desc
        let amountStr = String(format: "%.2f", entry.amount)
        cell.amount2.text = amountStr
        cell.date2.text = entry.date
        cell.category2.text = entry.category
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Arrays.entries.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
}
