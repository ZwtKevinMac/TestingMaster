///**
/**

UserSessionReducer.swift
Sport B.I.

Created by: Kevin on 22/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import Foundation
import ReSwift

func userSessionReducer(_ state: Loading<UserSession>?, action: Action) -> Loading<UserSession> {
    
    switch action as? UserAction {
        
    case nil:
        break
        
    case .authenticating?:
        
        return .loading
    case .handleUserSessionResult(let result)?:

        switch result {
            
        case .failure(let error):
            return .failure(error)
            
        case .success(let session):
            return .loaded(session)
        }
    }
    
    return state ?? .notAsked
}

