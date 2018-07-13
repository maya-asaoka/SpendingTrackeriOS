//
//  RemoveController.swift
//  SpendingTrackeriOS
//
//  Created by Maya Asaoka on 2018-07-13.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

// ViewController for both remove entry and remove category

import UIKit

class RemoveController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var isRemovingCategory = true
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (isRemovingCategory) {
            return Arrays.categories.count
        }
        else {
            return Arrays.entries.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (isRemovingCategory) {
            let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "singleCategory")
            cell.textLabel?.text = Arrays.categories[indexPath.row]
            return cell
        }
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "singleEntry2", for: indexPath) as! ViewControllerTableViewCell
            
            let entry = Arrays.entries[indexPath.row]
            
            cell.desc2.text = entry.desc
            let amountStr = String(format: "%.2f", entry.amount)
            cell.amount2.text = amountStr
            cell.date2.text = entry.date
            cell.category2.text = entry.category
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (isRemovingCategory) {
            Arrays.categories.remove(at: indexPath.row)
            tableView.reloadData()
        }
        else {
            Arrays.entries.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
}
