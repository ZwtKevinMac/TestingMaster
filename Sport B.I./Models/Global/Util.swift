///**
/**

Util.swift
Sport B.I.

Created by: Kevin on 05/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import UIKit
import ReSwift

class Util {
    
    class func prepareApplication() {
        
        mainStore.dispatch(prepareAppSettings())
        mainStore.dispatch(prepareInitialViewController())
        mainStore.dispatch(prepareProgressHud())
        mainStore.dispatch(prepareKeyboardManager())
    }
}
