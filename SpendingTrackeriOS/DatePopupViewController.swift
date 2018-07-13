//
//  DatePopupViewController.swift
//  SpendingTrackeriOS
//
//  Created by Maya Asaoka on 2018-07-12.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

import UIKit

class DatePopupViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var showDatePicker: Bool = true
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var categoryPicker: UIPickerView!
    var chosenDate = String()
    var chosenCategory = String()

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        if (showDatePicker == true) {
            datePicker.isHidden = false
            categoryPicker.isHidden = true
        }
        else {
            datePicker.isHidden = true
            categoryPicker.isHidden = false
        }
    }
    
    
    @IBAction func saveData(_ sender: Any) {
        if (showDatePicker == true) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/YY"
            chosenDate = dateFormatter.string(from: datePicker.date)
            NotificationCenter.default.post(name: .getDate, object: self)
            dismiss(animated: true)
        }
        else {
            chosenCategory = Arrays.categories[categoryPicker.selectedRow(inComponent: 0)]
            NotificationCenter.default.post(name: .getCategory, object: self)
            dismiss(animated: true)
        }
    }
    
    
    // category picker methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Arrays.categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Arrays.categories.count
    }
    
    
    
}


