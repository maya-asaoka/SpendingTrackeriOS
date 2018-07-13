//
//  SettingsViewController.swift
//  SpendingTrackeriOS
//
//  Created by Maya Asaoka on 2018-07-09.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

import UIKit

class SettingsViewController : UIViewController {
    
    @IBAction func sortByMostRecent(_ sender: Any) {
        NotificationCenter.default.post(name: .sortByMostRecent, object: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sortByLeastRecent(_ sender: Any) {
        NotificationCenter.default.post(name: .sortByLeastRecent, object: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sortAlphabetically(_ sender: Any) {
        NotificationCenter.default.post(name: .sortAlphabetically, object: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // set datepopupviewcontroller to show correct popup
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "removeCategorySegue") {
            let removeView = segue.destination as! RemoveController
            removeView.isRemovingCategory = true
        }
        if (segue.identifier == "removeEntrySegue") {
            let removeView = segue.destination as! RemoveController
            removeView.isRemovingCategory = false
        }
    }
    
}
