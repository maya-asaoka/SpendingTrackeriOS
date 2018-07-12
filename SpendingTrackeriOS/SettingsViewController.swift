//
//  SettingsViewController.swift
//  SpendingTrackeriOS
//
//  Created by Maya Asaoka on 2018-07-09.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

import UIKit

class SettingsViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sortByMostRecent(_ sender: Any) {
        NotificationCenter.default.post(name: .sortByMostRecent, object: nil)
        dismiss(animated: true)
    }
    
    @IBAction func sortByLeastRecent(_ sender: Any) {
        NotificationCenter.default.post(name: .sortByLeastRecent, object: nil)
        dismiss(animated: true)
    }
    
    @IBAction func sortAlphabetically(_ sender: Any) {
        NotificationCenter.default.post(name: .sortAlphabetically, object: nil)
        dismiss(animated: true)
    }
    
}
