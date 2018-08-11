//
//  MonthlyReportController.swift
//  SpendingTrackeriOS
//
//  Created by Maya Asaoka on 2018-08-04.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

// Creates a monthly expense report

import UIKit

class MonthlyReportController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var entriesForMonth = [Entry]()
    
    var monthYear = String()

    @IBOutlet weak var monthTitle: UILabel!
    @IBOutlet weak var monthlyTotal: UILabel!
    @IBOutlet weak var largestExpense: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // default to current month
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/YYYY"
        monthYear = dateFormatter.string(from: Date())
        createView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(getMonthYear), name: .getMonthYear, object: nil)
    }
    
    
    // if change month button pressed, show correct popup
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showMonthYearSegue") {
            let popup = segue.destination as! DatePopupViewController
            popup.showPicker = DatePopupViewController.Pickers.showMonthYearPicker
        }
    }
    

    @objc func getMonthYear(notification: Notification) {
        let datePopupVC = notification.object as! DatePopupViewController
        monthYear = datePopupVC.chosenMonthYear
        
        createView()
    }
    
    func createView() {
        setMonthTitle()
        addEntriesForMonth()
        setTotal()
        setLargestExpense()
    }
    
    func setMonthTitle() {
        monthTitle.text = monthYear
    }
    
    func addEntriesForMonth() {
        for entry in Arrays.entries {
            if (entry.date.hasSuffix(monthYear)) {
                entriesForMonth.append(entry)
            }
        }
    }
    
    func setTotal() {
        var total = 0.00
        for entry in entriesForMonth {
            total = total + entry.amount
        }
        monthlyTotal.text = String(total)
    }
    
    func setLargestExpense() {
        var largest = Entry(desc: "", amount: 0, date: "", category: "")
        for entry in entriesForMonth {
            if (entry.amount > largest.amount) {
                largest = entry
            }
        }
        if (largest.amount == 0) {
            largestExpense.text = "No expenses for chosen month"
        }
        else {
            largestExpense.text = largest.desc + ", " + String(largest.amount)
        }
    }
    
    
    // category breakdown tableview functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Arrays.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = Arrays.categories[indexPath.row]
        var total = 0.00
        for entry in entriesForMonth {
            if (entry.category == category) {
                total = total + entry.amount
            }
        }
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "singleCategoryMonthly")
        cell.textLabel?.text = category + ", $" + String(total)
        return cell
    }
    


}
