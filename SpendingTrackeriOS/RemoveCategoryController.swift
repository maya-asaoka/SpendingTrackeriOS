//
//  RemoveCategoryController.swift
//  SpendingTrackeriOS
//
//  Created by Maya Asaoka on 2018-07-11.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

import UIKit

class RemoveCategoryController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Arrays.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "singleCategory")
        cell.textLabel?.text = Arrays.categories[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Arrays.categories.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
}
