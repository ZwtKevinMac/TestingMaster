///**
/**

OrganizationReducer.swift
Sport B.I.

Created by: Kevin on 23/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import Foundation
import ReSwift

func organizationReducer(_ state: Loading<[Tenant]>?, action: Action) -> Loading<[Tenant]> {
    
    switch action as? OrganizationAction {
        
    case nil:
        break
        
    case .loading?:
        
        return .loading
    case .handleOrganizationResult(let result)?:
        
        switch result {
            
        case .failure(let error):
            return .failure(error)
            
        case .success(let organization):
            return .loaded(organization)
        }
    }
    
    return state ?? .notAsked
}
