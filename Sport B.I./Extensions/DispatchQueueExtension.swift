///**
/**

DispatchQueueExtension.swift
Sport B.I.

Created by: Kevin on 05/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import Foundation

extension DispatchQueue {
    
    static func main(completion:@escaping (() -> Void)) {
        
        DispatchQueue.main.async {
            
            completion()
        }
    }
}
