///**
/**

UserAction.swift
Sport B.I.

Created by: Kevin on 22/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import Foundation
import ReSwift

func login(_ parameter:[String: Any]?) -> (AppState, Store<AppState>) -> Action? {
    
    return { state, store in
        
        if case .loading = state.userSession,
            case .loaded = state.userSession { return nil }
        
        WebServiceAPI.userLogin(parameter, completion: { (session) in
            
            DispatchQueue.main {
                
                store.dispatch(UserAction.handleUserSessionResult(session!))
            }
        })
        
        return UserAction.authenticating
    }
}

enum UserAction: Action {
    
    case authenticating
    case handleUserSessionResult(Result<UserSession>)
}

struct userLogin: Action { }

