//
//  AddPurchaseController.swift
//  SpendingTrackeriOS
//
//  Created by Maya Asaoka on 2018-07-12.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

import UIKit

struct Format {
    
    static let dateFormat = "dd/MM/YYYY"
}

class AddEntryController : UIViewController {
    
    @IBOutlet weak var desc: UITextField!
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var date: UIButton!
    @IBOutlet weak var category: UIButton!
    
    var dateString = String()
    var categoryString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(getDate), name: .getDate, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(getCategory), name: .getCategory, object: nil)
    }
    
    @objc func getDate(notification: Notification) {
        let datePopupVC = notification.object as! DatePopupViewController
        dateString = datePopupVC.chosenDate
        date.setTitle(dateString, for: .normal)
    }
    
    @objc func getCategory(notification: Notification) {
        let datePopupVC = notification.object as! DatePopupViewController
        categoryString = datePopupVC.chosenCategory
        category.setTitle(categoryString, for: .normal)
    }
    
    @IBAction func confirmAdd(_ sender: Any) {
        // set defaults if null fields present
        if (desc.text!.isEmpty) {
            desc.text = "Purchase"
        }
        if (date.titleLabel?.text == "choose date") {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = Format.dateFormat
            // defaults date to current date
            dateString = dateFormatter.string(from: Date())
            date.setTitle(dateString, for: .normal)
        }
        if (category.titleLabel?.text == "choose category") {
            categoryString = "Other"
            category.setTitle(categoryString, for: .normal)
        }
        if (amount.text!.isEmpty) {
            Alert.showErrorMessage(title: "Incomplete Entry", message: "Please enter amount", vc: self)
        }
        if (!isValidAmount(amount: amount.text!)) {
            Alert.showErrorMessage(title: "Invalid Amount", message: "Please enter valid dollar amount (no commas or dollar signs)", vc: self)
        }
        else if (!amount.text!.isEmpty && isValidAmount(amount: amount.text!)){
            NotificationCenter.default.post(name: .addEntry, object: self)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    // check if string is a valid currency value
    func isValidAmount(amount: String) -> Bool {
        let currencyFormat = "[0-9]*(\\.[0-9][0-9]{0,1}){0,1}"
        let currencyPredicate = NSPredicate(format: "SELF MATCHES %@", currencyFormat)
        return currencyPredicate.evaluate(with: amount)
    }
    
    
    // check whether choose date or choose category button was pressed - show correct popup
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "chooseDateSegue") {
            let popup = segue.destination as! DatePopupViewController
            popup.showPicker = DatePopupViewController.Pickers.showDatePicker
        }
        if (segue.identifier == "chooseCategorySegue") {
            let popup = segue.destination as! DatePopupViewController
            popup.showPicker = DatePopupViewController.Pickers.showCategoryPicker
        }
    }
    
    
}
