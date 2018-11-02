///**
/**

APIConfigurationReducer.swift
Sport B.I.

Created by: Kevin on 18/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import UIKit
import ReSwift
import Alamofire

func apiConfigurationReducer(_ state: APIConfigurationState?, action: Action) -> APIConfigurationState {
    
    var state = state ?? initialState()
    
    switch action {
        
    case is loginConfig:
        
        state.header.removeAll()
        state.header[Text.contentType]   = Text.urlEncodedType
        state.header[Text.authorization] = "Basic "+"\(state.clientID):\(state.clientSecret)".toBase64()
        state.encoding = URLEncoding.httpBody
    case is generalConfig:
        
        state.header.removeAll()
        state.header[Text.contentType] = Text.jsonType
        
        state.header[Text.authorization] = "Bearer \(state.accessToken)"
        state.encoding = URLEncoding.default
        state.baseAPIPath = state.baseAPIPath + "/" + Text.endPoint
    case let action as setAccessToken:
        
        state.accessToken = action.value
        userDefault.set("\(action.value)", forKey: Text.accessToken)
        userDefault.synchronize()
    default:
        return state
    }
    
    return state
}

private func initialState() -> APIConfigurationState {
    
    guard let info = NSDictionary(contentsOfFile: plistPath ?? "") else {
        
        fatalError("Unable to parse plist into dictionary")
    }
    
    guard let host = info.object(forKey: "Host") else {
        
        fatalError("APIConfiguration.Host is required in info.plist")
    }
    
    guard let scheme = info.object(forKey: "Scheme") else {
        
        fatalError("APIConfiguration.Scheme is required in info.plist")
    }
    
    guard let clientSecret = info.object(forKey: "ClientSecret") else {
        
        fatalError("APIConfiguration.ClientSecret is required in info.plist")
    }
    
    guard let clientID = info.object(forKey: "ClientID") else {
        
        fatalError("APIConfiguration.ClientID is required in info.plist")
    }
    
    let state = APIConfigurationState(header: ["":""], baseAPIPath: "\(scheme)://\(host)", clientID: "\(clientID)", clientSecret: "\(clientSecret)", accessToken: "", encoding: URLEncoding.default)
    
    return state
}

private func setTokenToPlist(_ token: String) {

    guard let info = NSDictionary(contentsOfFile: plistPath ?? "") else {

        fatalError("Unable to parse plist into dictionary")
    }

    var accessToken = info.object(forKey: "AccessToken")
    print(accessToken ?? "")
    accessToken = token
}


