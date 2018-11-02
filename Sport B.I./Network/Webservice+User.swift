///**
/**

Webservice+Intro.swift
Sport B.I.

Created by: Kevin on 22/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import Foundation

enum Result<T> {
    
    case success(T)
    case failure(Error)
}

extension WebService {
    
    public func userLogin(_ parameter:[String: Any]?, completion:@escaping (Result<UserSession>?) -> Void) {
        
        self.sendRequest(.login(parameter!), withEndPath: "").responseJSON { (response) in
            
            switch response.result {
            case .success( _):
                
                if response.response?.statusCode == Text.RCode.success {
                    
                    do {
                        let userSession = try decoder.decode(UserSession.self, from: response.data!)
                        
                        completion(.success(userSession))
                    } catch (let error) {
                    
                        print(error.localizedDescription)
                        completion(.failure(error))
                    }
                } else {
                    
                    let eroror: Error = NSError(domain: "", code: response.response!.statusCode, userInfo: nil)
                    completion(.failure(eroror))
                }
            case .failure(let error):
                
                completion(.failure(error))
            }
        }
    }
    
    public func fetchOrganization(completion:@escaping (Result<[Tenant]>?) -> Void) {
        
        self.sendRequest(.getOrganization, withEndPath: "").responseJSON { (response) in
            
            switch response.result {
            case .success( _):
                
                if response.response?.statusCode == Text.RCode.success {
                    
                    do {
                        let organization = try decoder.decode([Tenant].self, from: response.data!)
                        
                        completion(.success(organization))
                    } catch (let error) {
                        
                        completion(.failure(error))
                    }
                } else {
                    
                    let eroror: Error = NSError(domain: "", code: response.response!.statusCode, userInfo: nil)
                    completion(.failure(eroror))
                }
            case .failure(let error):
                
                completion(.failure(error))
            }
        }
    }
    
    public func fetchVenue(completion:@escaping (Result<[Tenant]>?) -> Void) {
        
        self.sendRequest(.getVenue, withEndPath: "").responseJSON { (response) in
            
            switch response.result {
            case .success( _):
                
                if response.response?.statusCode == Text.RCode.success {
                    
                    do {
                        let userSession = try decoder.decode([Tenant].self, from: response.data!)
                        
                        completion(.success(userSession))
                    } catch (let error) {
                        
                        print(error.localizedDescription)
                        completion(.failure(error))
                    }
                } else {
                    
                    let eroror: Error = NSError(domain: "", code: response.response!.statusCode, userInfo: nil)
                    completion(.failure(eroror))
                }
            case .failure(let error):
                
                completion(.failure(error))
            }
        }
    }
}
