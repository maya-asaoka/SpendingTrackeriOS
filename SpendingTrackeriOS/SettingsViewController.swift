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

class SettingsViewController : UIViewController, AddCategoryDelegate {
    
    weak var delegate: SortingDelegate?
    
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! AddCategoryController
        controller.delegate = self
    }
    
    
}
