///**
/**

TenantExtension.swift
Sport B.I.

Created by: Kevin on 25/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import UIKit

//MARK: - UIPickerViewDelegate and UIPickerViewDataSource Methods
extension TenantSelectionViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if txtOrganization.isFirstResponder {
            
            return arrOrganizations.count
        } else {
            
            return arrVenues.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if txtOrganization.isFirstResponder {
            
            return arrOrganizations[row].name
        } else {
            
            return arrVenues[row].name
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if txtOrganization.isFirstResponder {
            
            txtOrganization.text = arrOrganizations[row].name
        } else {
            
            txtVenue.text = arrVenues[row].name
        }
    }
}
