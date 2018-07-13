//
//  NotificationNameExtension.swift
//  SpendingTrackeriOS
//
//  Created by Maya Asaoka on 2018-07-11.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

import Foundation

extension Notification.Name {
    
    static let saveCategoryName = Notification.Name(rawValue: "saveCategoryName")
    
    static let sortByMostRecent = Notification.Name(rawValue: "sortByMostRecent")
    static let sortByLeastRecent = Notification.Name(rawValue: "sortByLeastRecent")
    static let sortAlphabetically = Notification.Name(rawValue: "sortAlphabetically")
    
    static let getDate = Notification.Name(rawValue: "getDate")
    static let getCategory = Notification.Name(rawValue: "getCategory")
    static let addEntry = Notification.Name(rawValue: "addEntry")
    
}
