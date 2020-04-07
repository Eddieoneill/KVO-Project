//
//  Settings.swift
//  KVL-Project
//
//  Created by Edward O'Neill on 4/7/20.
//  Copyright © 2020 Edward O'Neill. All rights reserved.
//

import Foundation

// Settings needs to be KVO-compliant
@objc class Settings: NSObject {
    static var shared = Settings()
    @objc dynamic var fontSize: Int
    @objc dynamic var iconName: String
    
    override private init() {
        fontSize = 17
        iconName = "sun.haze.fill"
    }
}
