//
//  SettingsViewController.swift
//  SpendingTrackeriOS
//
//  Created by Maya Asaoka on 2018-07-09.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

import UIKit

protocol SortingDelegate: class {
    func sortByMostRecent()
    func sortByLeastRecent()
    func sortAlphabetically()
    func addCategory(cat : String)
    func removeCategory(cat : String)
}

class SettingsViewController : UIViewController {
    
    weak var delegate: SortingDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleAddCategory), name: .saveCategoryName, object: nil)
    }
    
    @objc func handleAddCategory(notification: Notification) {
        let addCategoryVC = notification.object as! AddCategoryController
        let categoryName = addCategoryVC.categoryNameField.text!
        delegate?.addCategory(cat: categoryName)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sortByMostRecent(_ sender: Any) {
        delegate?.sortByMostRecent()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sortByLeastRecent(_ sender: Any) {
        delegate?.sortByLeastRecent()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sortAlphabetically(_ sender: Any) {
        delegate?.sortAlphabetically()
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
