//
//  Alert.swift
//  SpendingTrackeriOS
//
//  Created by Maya Asaoka on 2018-07-13.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

// popup alerts

import UIKit

class Alert {
    
    class func showErrorMessage(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
    
}
