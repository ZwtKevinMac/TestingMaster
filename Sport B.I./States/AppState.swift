///**
/**
 
 AppState.swift
 Sport B.I.
 
 Created by: Kevin on 05/10/18
 Using Swift 4.0
 Running on macOS 10.14
 
 Copyright (c) 2018 ClubSpeed. All rights reserved.
 
 */

import Foundation
import ReSwift

//MARK: - Global App State
struct AppState: StateType {
    
    var appSettings: AppSettingsState
    var apiConfiguration: APIConfigurationState
    var userSession: Loading<UserSession> = .notAsked
    var organization: Loading<[Tenant]> = .notAsked
    var venue: Loading<[Tenant]> = .notAsked
}
