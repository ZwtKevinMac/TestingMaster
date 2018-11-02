///**
/**

LogInViewController.swift
Sport B.I.

Created by: Kevin on 08/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import UIKit
import ReSwift
import LocalAuthentication

class LogInViewController: BaseViewController {
    
    //MARK: - Outlets
    @IBOutlet var txtUserName: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: SBIButton!
    @IBOutlet weak var btnForgotPassword: SBIButton!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        mainStore.subscribe(self)
        prepareView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(true)
        mainStore.unsubscribe(self)
    }
    
    //MARK: - View Methods
    fileprivate func prepareView() {
        
        btnLogin.isEnabled = false
       
        mainStore.dispatch(loginConfig())
        
        if let _ = userDefault.value(forKey: Text.accessToken) {
            
            prepareTouchID()
        }
    }
    
    //MARK: - Helper Method
    fileprivate func prepareTouchID() {
        
        let context = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: Text.AppMessages.touchIDReason) { (isCorrect, error) in
                
                if isCorrect {
                    
                    DispatchQueue.main {
                        
                        self.navigateToSelection(userDefault.value(forKey: Text.accessToken) as! String)
                    }
                }
            }
        }
    }
    
    fileprivate func navigateToSelection(_ token: String) {
    
        showProgressHUD()
        
        let orgAndVenueVC = TenantSelectionViewController.instatiate()
        orgAndVenueVC.token = token
        
        mainStore.state.appSettings.navigationController.pushViewController(orgAndVenueVC, animated: false)
    }
    
    //MARK: - Action Methods
    @IBAction func btnLoginAction(_ sender: Any) {
        
        self.view.endEditing(true)
        
        let parameter = ["grant_type" : "password",
                         "username"   : txtUserName.text!.trimmed,
                         "password"   : txtPassword.text!.trimmed
                         
            ] as [String: Any]
        
        mainStore.dispatch(login(parameter))
    }
    
    @IBAction func btnForgotPasswordAction(_ sender: Any) {
    
        UIApplication.shared.open(URL(string: forgotPwdURL)!)
    }
}

//MARK: StoreSubscriber Methods
extension LogInViewController: StoreSubscriber {
    
    func newState(state: AppState) {
        
        switch state.userSession {
            
        case .loading:
            
            showProgressHUD()
        case .loaded(let session):
            
            navigateToSelection(session.access_token)
        case .failure(_):
            
            hideProgressHUD()
            btnLogin.shake()
        case .notAsked:
            break
        }
    }
}

//MARK: - UITextFieldDelegate Method
extension LogInViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var username = txtUserName.text?.trimmed ?? ""
        var password = txtPassword.text?.trimmed ?? ""
        
        if textField == txtUserName {
            
            username = NSString(string: username).replacingCharacters(in: range, with: string)
        } else if textField == txtPassword {
            
            password = NSString(string: password).replacingCharacters(in: range, with: string)
        }

        btnLogin.isEnabled = !username.isEmpty && !password.isEmpty
        return true
    }
}


