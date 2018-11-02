///**
/**

VenueAction.swift
Sport B.I.

Created by: Kevin on 23/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import Foundation
import ReSwift

func fetchVenue() -> (AppState, Store<AppState>) -> Action? {
    
    return { state, store in
        
        if case .loading = state.venue,
            case .loaded = state.venue { return nil }
        
        WebServiceAPI.fetchVenue(completion: { (venue) in
            
            DispatchQueue.main {
                
                store.dispatch(VenueAction.handleVenueResult(venue!))
            }
        })
        
        return VenueAction.loading
    }
}

enum VenueAction: Action {
    
    case loading
    case handleVenueResult(Result<[Tenant]>)
}
