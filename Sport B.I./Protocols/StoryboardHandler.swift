///**
/**

StoryboardHandler.swift
Sport B.I.

Created by: Kevin on 16/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import UIKit
import ReSwift

/// A protocol that lets us instantiate view controllers from Main storyboard.
protocol StoryboardHandler { }

extension StoryboardHandler where Self: UIViewController {

    static func instatiate() -> Self {

        let storyboardIdentifier = String(describing: self)

        return mainStore.state.appSettings.storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
    }
}

