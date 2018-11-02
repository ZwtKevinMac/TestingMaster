///**
/**
 
 StringExtension.swift
 Sport B.I.
 
 Created by: Kevin on 05/10/18
 Using Swift 4.0
 Running on macOS 10.14
 
 Copyright (c) 2018 ClubSpeed. All rights reserved.
 
 */

import UIKit

extension String {
    
    var trimmed: String {
        
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func toBase64() -> String {
        
        return Data(self.utf8).base64EncodedString()
    }
}
