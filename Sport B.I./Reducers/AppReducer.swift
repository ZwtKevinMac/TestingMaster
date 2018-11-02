///**
/**
 
 AppReducer.swift
 Sport B.I.
 
 Created by: Kevin on 05/10/18
 Using Swift 4.0
 Running on macOS 10.14
 
 Copyright (c) 2018 ClubSpeed. All rights reserved.
 
 */

import Foundation
import ReSwift
 
func appReducer(action: Action, state: AppState?) -> AppState {
    
    switch action {
    default:
        return AppState(
            appSettings: appSettingsReducer(state?.appSettings, action: action),
            apiConfiguration: apiConfigurationReducer(state?.apiConfiguration, action: action),
            userSession: userSessionReducer(state?.userSession, action: action),
            organization: organizationReducer(state?.organization, action: action),
            venue: venueReducer(state?.venue, action: action)
        )
    }
}
