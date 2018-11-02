///**
/**

OrgAndVenueSelectionViewController.swift
Sport B.I.

Created by: Kevin on 23/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import UIKit
import ReSwift

class TenantSelectionViewController: BaseViewController {

    //MARK: - Outlets
    @IBOutlet weak var txtOrganization: SBITextField!
    @IBOutlet weak var txtVenue: SBITextField!
    
    //MARK: - Proporties
    var token: String = ""
    var arrOrganizations: [Tenant]!
    var arrVenues: [Tenant]!

    var pickerView: UIPickerView = UIPickerView()
    
    //MARK: - Override Method
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        mainStore.subscribe(self)
        prepareView()
    }
    
    //MARK: - View Methods
    fileprivate func prepareView() {
        
        mainStore.dispatch(setAccessToken(value: token))
        mainStore.dispatch(generalConfig())
        mainStore.dispatch(fetchOrganization())
        mainStore.dispatch(fetchVenue())
        
        pickerView.delegate    = self
        pickerView.dataSource  = self
        
        txtOrganization.inputView = pickerView
        txtVenue.inputView        = pickerView
        
        pickerView.backgroundColor = UIColor(bundleName: "BILightPink")
    }
}

//MARK: - UITextViewDelegate Method
extension TenantSelectionViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        pickerView.reloadAllComponents()
        pickerView.selectRow(0, inComponent: 0, animated: false)
    }
}

//MARK: - StoreSubscriber Methods
extension TenantSelectionViewController: StoreSubscriber {
    
    func newState(state: AppState) {
        
        switch state.organization {
            
        case .loading:
            
            showProgressHUD()
        case .loaded(let organizations):
            
            hideProgressHUD()
        
            arrOrganizations = organizations
            pickerView.reloadAllComponents()
        default:
            break
        }
        
        switch state.venue {
            
        case .loaded(let venues):
            
            arrVenues = venues
            pickerView.reloadAllComponents()
        default:
            break
        }
    }
}
