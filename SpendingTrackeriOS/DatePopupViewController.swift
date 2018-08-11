//
//  DatePopupViewController.swift
//  SpendingTrackeriOS
//
//  Created by Maya Asaoka on 2018-07-12.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

// popup for date picker and category picker

import UIKit

class DatePopupViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    enum Pickers {
        case showDatePicker
        case showCategoryPicker
        case showMonthYearPicker
    }
    
    var showPicker: Pickers = Pickers.showDatePicker
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var chosenDate = String()
    var chosenCategory = String()
    var chosenMonthYear = String()
    
    override func viewWillAppear(_ animated: Bool) {
        if (showPicker == Pickers.showDatePicker) {
            datePicker.isHidden = false
            picker.isHidden = true
            titleLabel.text = "Choose Date"
        }
        if (showPicker == Pickers.showCategoryPicker) {
            datePicker.isHidden = true
            picker.isHidden = false
            titleLabel.text = "Choose Category"
        }
        if (showPicker == Pickers.showMonthYearPicker) {
            datePicker.isHidden = false
            picker.isHidden = true
            titleLabel.text = "Generate Report For Month"
        }
    }
    
    
    @IBAction func saveData(_ sender: Any) {
        if (showPicker == Pickers.showDatePicker) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = Format.dateFormat
            chosenDate = dateFormatter.string(from: datePicker.date)
            NotificationCenter.default.post(name: .getDate, object: self)
            dismiss(animated: true)
        }
        if (showPicker == Pickers.showCategoryPicker) {
            chosenCategory = Arrays.categories[picker.selectedRow(inComponent: 0)]
            NotificationCenter.default.post(name: .getCategory, object: self)
            dismiss(animated: true)
        }
        if (showPicker == Pickers.showMonthYearPicker) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/YYYY"
            chosenMonthYear = dateFormatter.string(from: datePicker.date)
            NotificationCenter.default.post(name: .getMonthYear, object: self)
            dismiss(animated: true)
        }
    }
    
    
    // category/monthyear picker methods
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


