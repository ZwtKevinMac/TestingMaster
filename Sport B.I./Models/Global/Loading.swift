///**
/**

Result.swift
Sport B.I.

Created by: Kevin on 16/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import Foundation

enum Loading<T> {
    
    case notAsked
    case loading
    case loaded(T)
    case failure(Error)
}
