//
//  ShowCategoryController.swift
//  SpendingTrackeriOS
//
//  Created by Maya Asaoka on 2018-07-10.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

import UIKit

class AddCategoryController : UIViewController {
    
    @IBOutlet weak var categoryNameField: UITextField!
    
    @IBAction func confirmAddCategory(_ sender: Any) {
        NotificationCenter.default.post(name: .saveCategoryName, object: self)
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
