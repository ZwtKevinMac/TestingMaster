///**
/**

Constant.swift
Sport B.I.

Created by: Kevin on 08/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import UIKit
import ReSwift

internal let encoder = JSONEncoder()
internal let decoder = JSONDecoder()

internal let appDelegate = UIApplication.shared.delegate as! AppDelegate

internal let userDefault = UserDefaults.standard

internal let mainStore = Store<AppState>(reducer: appReducer, state: nil)

internal let plistPath = Bundle.main.path(forResource: "Info", ofType: "plist")

internal let forgotPwdURL = "http://admin.clubspeedsport.com/forgot?redirectUrl=cs-cloud-mobileapplication://forgotPassword"

