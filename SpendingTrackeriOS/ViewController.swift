//
//  ViewController.swift
//  SpendingTrackeriOS
//
//  Created by Maya Asaoka on 2018-07-09.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var totalView: UILabel!
    
    var entries = [Entry]()
    var categories = ["Books", "Clothing", "Electronics", "Entertainment", "Food", "Gifts", "Medical", "Music", "Other",
                      "Pets", "Transportation", "Travel"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "singleEntry", for: indexPath) as! ViewControllerTableViewCell
        
        let entry = entries[indexPath.row]
        
        cell.desc.text = entry.desc
        let amountStr = String(format: "%.2f", entry.amount)
        cell.amount.text = amountStr
        cell.date.text = entry.date
        cell.category.text = entry.category
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addDemoEntries()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleAddCategory), name: .saveCategoryName, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(sortByMostRecent), name: .sortByMostRecent, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(sortByLeastRecent), name: .sortByLeastRecent, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(sortAlphabetically), name: .sortAlphabetically, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        totalView.text = "Total: $" + String(format: "%.2f", calculateTotal())
    }
    
    func calculateTotal() -> Double {
        var total = 0.00
        for entry in entries {
            total = total + entry.amount
        }
        return total
    }
    
    
    // methods for managing categories
    
    @objc func handleAddCategory(notification: Notification) {
        let addCategoryVC = notification.object as! AddCategoryController
        let categoryString = addCategoryVC.categoryNameField.text!
        addCategory(cat: categoryString)
    }
    
    func addCategory(cat : String) {
        print("Adding category: " + cat)
        if (!categories.contains(cat)) {
            categories.append(cat)
            categories.sort()
        }
    }
    
    func removeCategory(cat : String) {
        categories = categories.filter( { $0 != cat } )
    }
    
    
    
    
    // methods for managing entries
    
    @objc func sortByMostRecent() {
        entries.sort {
            if ($0.date[$0.date.index($0.date.startIndex, offsetBy: 6)...] != $1.date[$1.date.index($1.date.startIndex, offsetBy: 6)...]) {
                return $0.date[$0.date.index($0.date.startIndex, offsetBy: 6)...] > $1.date[$1.date.index($1.date.startIndex, offsetBy: 6)...]
            }
            else if ($0.date[$0.date.index($0.date.startIndex, offsetBy: 3)..<$0.date.index($0.date.startIndex, offsetBy: 5)] !=
                     $1.date[$1.date.index($1.date.startIndex, offsetBy: 3)..<$1.date.index($1.date.startIndex, offsetBy: 5)]) {
                return $0.date[$0.date.index($0.date.startIndex, offsetBy: 3)..<$0.date.index($0.date.startIndex, offsetBy: 5)] >
                    $1.date[$1.date.index($1.date.startIndex, offsetBy: 3)..<$1.date.index($1.date.startIndex, offsetBy: 5)]
            }
            else {
                return $0.date[..<$0.date.index($0.date.startIndex, offsetBy: 2)] > $1.date[..<$1.date.index($1.date.startIndex, offsetBy: 2)]
            }
        }
    }
    
    @objc func sortByLeastRecent() {
        sortByMostRecent()
        entries.reverse()
    }
    
    @objc func sortAlphabetically() {
        entries.sort(by: { $0.desc < $1.desc })
    }
    
    
    func addDemoEntries() {
        entries.append(Entry(desc: "Concert Tickets", amount: 50.00, date: "09/07/18", category: "Entertainment"))
        entries.append(Entry(desc: "Headphones", amount: 119.99, date: "07/07/18", category: "Electronics"))
        entries.append(Entry(desc: "New Book", amount: 20.00, date: "07/07/18", category: "Books"))
        entries.append(Entry(desc: "Movie Tickets", amount: 12.00, date: "01/07/18", category: "Entertainment"))
        entries.append(Entry(desc: "Sushi", amount: 13.00, date: "28/06/18", category: "Food"))
        entries.append(Entry(desc: "New Shirt", amount: 40.00, date: "20/06/18", category: "Clothing"))
        entries.append(Entry(desc: "Starbucks", amount: 45.50, date: "20/06/18", category: "Food"))
        entries.append(Entry(desc: "Phone Case", amount: 19.99, date: "20/06/18", category: "Electronics"))
        entries.append(Entry(desc: "New Shoes", amount: 124.99, date: "15/06/18", category: "Clothing"))
        entries.append(Entry(desc: "Movie Tickets", amount: 11.99, date: "08/06/18", category: "Entertainment"))
        entries.append(Entry(desc: "Bus Pass", amount: 30.00, date: "01/06/18", category: "Transportation"))
        sortByMostRecent()
    }

}

