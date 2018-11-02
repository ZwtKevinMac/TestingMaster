///**
/**

UIColorExtension.swift
Sport B.I.

Created by: Kevin on 18/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import UIKit

extension UIColor {
    /// Creates a UIColor instance from a filename in our bundle.
    convenience init(bundleName: String) {
        
        self.init(named: bundleName)!
    }
}
