///**
/**

AppSettingsReducer.swift
Sport B.I.

Created by: Kevin on 16/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import Foundation
import ReSwift
import SVProgressHUD
import IQKeyboardManagerSwift

 func appSettingsReducer(_ state: AppSettingsState?, action: Action) -> AppSettingsState {
    
    let state = state ?? initialState()
    
    switch action {
        
    case is prepareProgressHud:
        
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setBackgroundColor(UIColor(bundleName: "BIGrey"))
        SVProgressHUD.setForegroundColor(UIColor(bundleName: "BIRed"))
    case is prepareInitialViewController:
        
        let loginVC = state.storyboard.instantiateViewController(withIdentifier: LogInViewController.className) as! LogInViewController
        
        state.navigationController.pushViewController(loginVC, animated: false)
        
        appDelegate.window?.rootViewController = mainStore.state.appSettings.navigationController
    case is prepareKeyboardManager:
        
        IQKeyboardManager.shared.enable = true
    default:
        
        return state
    }
    
    return state
}

private func initialState() -> AppSettingsState {
    
    let storyboard = UIStoryboard(name: Text.AppSettings.storyboard, bundle: nil)
    
    let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
    
    let state = AppSettingsState(navigationController: navigationController, storyboard: storyboard)
    
    return state
}
