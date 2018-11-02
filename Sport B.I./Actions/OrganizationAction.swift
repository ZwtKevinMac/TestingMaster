///**
/**

OrganizationAction.swift
Sport B.I.

Created by: Kevin on 23/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import Foundation
import ReSwift

func fetchOrganization() -> (AppState, Store<AppState>) -> Action? {
    
    return { state, store in
        
        if case .loading = state.organization,
            case .loaded = state.organization { return nil }
        
        WebServiceAPI.fetchOrganization(completion: { (organization) in
            
            DispatchQueue.main {
                
                store.dispatch(OrganizationAction.handleOrganizationResult(organization!))
            }
        })
        
        return OrganizationAction.loading
    }
}

enum OrganizationAction: Action {
    
    case loading
    case handleOrganizationResult(Result<[Tenant]>)
}

