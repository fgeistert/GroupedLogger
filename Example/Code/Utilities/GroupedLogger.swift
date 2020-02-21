//
//  GroupedLogger.swift
//  Example
//
//  Created by Fabian Geistert on 3/30/19.
//  Copyright © 2019 PocketSchool. All rights reserved.
//

import Foundation
import GroupedLogger

// setup logger
let log = GroupedLogger.shared

// custom logging groups
extension GroupedLogger.Group {
    static let sync = GroupedLogger.Group("Sync")
    static let moya = GroupedLogger.Group("Moya")
}
