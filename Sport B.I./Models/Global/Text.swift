///**
/**

Text.swift
Sport B.I.

Created by: Kevin on 08/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import UIKit

struct Text {
    
    static let accessToken    = "AccessToken"
    static let authorization  = "Authorization"
    static let contentType    = "Content-Type"
    static let urlEncodedType = "application/x-www-form-urlencoded"
    static let jsonType       = "application/json"
    static let endPoint       = "api/v1/"
    
    struct RCode {
        
        static let success = 200
    }
    
    struct AppSettings {
        
        static let storyboard = "Sport BI"
    }
    
    struct AppMessages {
        
        static let touchIDReason = "Biometric Authntication needed for login!"
    }
}
