///**
/**

WebService.swift
Sport B.I.

Created by: Kevin on 16/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import Foundation
import Alamofire

let WebServiceAPI: WebService = WebService.APIClient

class WebService: SessionManager {
    
    static let APIClient: WebService = {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 180
        configuration.timeoutIntervalForRequest  = 180
        
        return WebService(configuration: configuration)
    }()
    
    func sendRequest(_ route: Router, withEndPath endPath: String)
        -> DataRequest {
            
            var path = route.path + endPath
            path = path.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
            
            return self.request(path, method: route.method, parameters: route.parameters, encoding: mainStore.state.apiConfiguration.encoding, headers: mainStore.state.apiConfiguration.header)
    }
}
