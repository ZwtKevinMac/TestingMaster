///**
/**

Actions.swift
Sport B.I.

Created by: Kevin on 09/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import Foundation
import ReSwift

struct prepareAppSettings: Action { }
struct prepareInitialViewController: Action { }
struct prepareKeyboardManager: Action { }
struct prepareProgressHud: Action { }

struct loginConfig: Action { }
struct generalConfig: Action { }
struct setAccessToken: Action { let value: String }
