///**
/**

APIConfigurationState.swift
Sport B.I.

Created by: Kevin on 18/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import UIKit
import Alamofire

struct APIConfigurationState {
    
    var header: [String:String]
    var baseAPIPath: String
    var clientID: String
    var clientSecret: String
    var accessToken: String
    var encoding: ParameterEncoding
}
