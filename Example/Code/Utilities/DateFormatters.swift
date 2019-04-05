//
//  DateFormatters.swift
//  Example
//
//  Created by Fabian Geistert on 3/30/19.
//  Copyright © 2019 PocketSchool. All rights reserved.
//

import Foundation

// date formatters
var standardDateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss"
    return dateFormatter
}()
