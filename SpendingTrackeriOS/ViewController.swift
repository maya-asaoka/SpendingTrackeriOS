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
    
    var entries = [Entry(desc: "Concert Tickets", amount: 50.00, date: "07/09/18", category: "Entertainment"),
                   Entry(desc: "New Book", amount: 20.00, date: "07/07/18", category: "Books"),
                   Entry(desc: "Movie Tickets", amount: 12.00, date: "07/01/18", category: "Entertainment"),
                   Entry(desc: "Sushi", amount: 13.00, date: "06/28/18", category: "Food"),
                   Entry(desc: "New Shirt", amount: 40.00, date: "06/20/18", category: "Clothing"),
                   Entry(desc: "Starbucks", amount: 4.50, date: "06/20/18", category: "Food")]
    var categories = ["Books", "Clothing", "Entertainment", "Food", "Gifts", "Medical", "Music", "Other", "Pets",
                      "Transportation", "Travel"]
    
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
        // Do any intial setup after loading the view, typically from a nib
    }
    
    override func viewWillAppear(_ animated: Bool) {
        totalView.text = "Total: $" + String(format: "%.2f", calculateTotal())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateTotal() -> Double {
        var total = 0.00
        for entry in entries {
            total = total + entry.amount
        }
        return total
    }

}

