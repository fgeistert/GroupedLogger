//
//  ViewController.swift
//  Example
//
//  Created by Fabian Geistert on 3/29/19.
//  Copyright © 2019 PocketSchool. All rights reserved.
//

import UIKit
import GroupedLogger

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        log.info("Hello from \(self)")
        
        // turn on emojis again
        
        log.setSettings(to: GroupedLogger.Settings(useTimestamp: .no, useEmoji: .yes))
        log.success("Better hello from \(self)")
        
    }

}
