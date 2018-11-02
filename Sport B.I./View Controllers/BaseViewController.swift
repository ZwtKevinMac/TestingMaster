///**
/**
 
 BaseViewController.swift
 Sport B.I.
 
 Created by: Kevin on 05/10/18
 Using Swift 4.0
 Running on macOS 10.14
 
 Copyright (c) 2018 ClubSpeed. All rights reserved.
 
 */

import UIKit
import SVProgressHUD
import ReSwift

class BaseViewController: UIViewController, StoryboardHandler {

    //MARK: - Override Methods
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override var prefersStatusBarHidden: Bool {
        
        return true
    }
    
    //MARK: - SVProgressHUD Methods
    func showProgressHUD() {
        
        SVProgressHUD.show()
    }
    
    func hideProgressHUD() {
        
        SVProgressHUD.dismiss()
    }
}




