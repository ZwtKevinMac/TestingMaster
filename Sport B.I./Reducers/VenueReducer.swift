///**
/**

VenueReducer.swift
Sport B.I.

Created by: Kevin on 23/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import Foundation
import ReSwift

func venueReducer(_ state: Loading<[Tenant]>?, action: Action) -> Loading<[Tenant]> {
    
    switch action as? VenueAction {
        
    case nil:
        break
        
    case .loading?:
        
        return .loading
    case .handleVenueResult(let result)?:
        
        switch result {
            
        case .failure(let error):
            return .failure(error)
            
        case .success(let venue):
            return .loaded(venue)
        }
    }
    
    return state ?? .notAsked
}
