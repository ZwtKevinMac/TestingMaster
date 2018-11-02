///**
/**

Router.swift
Sport B.I.

Created by: Kevin on 16/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import Foundation
import Alamofire
import ReSwift

protocol Routable {
    
    var path        : String {get}
    var method      : HTTPMethod {get}
    var parameters  : Parameters? {get}
}

enum Router: Routable {
    
    case getOrganization
    case getVenue
    case login(Parameters)
}

extension Router {

    var path: String {
        
        switch self {
            
        case .login:
            return mainStore.state.apiConfiguration.baseAPIPath + "/oauth/token"
        case .getOrganization:
            return mainStore.state.apiConfiguration.baseAPIPath + "organizations/mine"
        case .getVenue:
            return mainStore.state.apiConfiguration.baseAPIPath + "venues/mine"
        }
    }
}

extension Router {

    var method: HTTPMethod {
        
        switch self {
            
        case .login:
            return .post
        case .getVenue, .getOrganization:
            return .get
        }
    }
}

extension Router {

    var parameters: Parameters? {
        
        switch self {
            
        case .login(let param):
            return param
        case .getOrganization, .getVenue:
            return nil
        }
    }
}


