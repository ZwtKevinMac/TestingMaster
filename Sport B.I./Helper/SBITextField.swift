///**
/**

SBITextField.swift
Sport B.I.

Created by: Kevin on 09/10/18
Using Swift 4.0
Running on macOS 10.14

Copyright (c) 2018 ClubSpeed. All rights reserved.

*/

import UIKit

@IBDesignable
class SBITextField: UITextField {
    
    //MARK: - Properties
    var rightOffset: CGFloat = 0
    
    @IBInspectable dynamic open var placeholderColor: UIColor = .white {
        
        didSet { updatePlaceholder() }
    }
    
    @IBInspectable dynamic open var rightImage: UIImage? {
        
        didSet { setRightImage(rightImage!) }
    }
    
    @IBInspectable dynamic open var placeholderString: String = "" {
        
        didSet { updatePlaceholder() }
    }
    
    @IBInspectable dynamic open var borderRadius: Int = 0  {
        
        didSet { updateCornerRadius() }
    }
    
    //MARK: - Override Methods
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    }
    
    internal required init?(coder: NSCoder) {
        
        super.init(coder: coder)
    }
    
    //MARK: - Helper Method
    private func updateCornerRadius() {
        
        layer.masksToBounds = true
        layer.cornerRadius = CGFloat(borderRadius)
    }
    
    private func updatePlaceholder() {
        
        attributedPlaceholder = NSAttributedString(string: placeholderString,attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
    }
    
    private func setRightImage(_ rightImage: UIImage) {
        
        let imgvRight = UIImageView(image: rightImage)
        
        imgvRight.frame = CGRect(x: 0 , y: 0, width: self.frame.height - 80, height: self.frame.height - 85)
        
        imgvRight.contentMode = .scaleAspectFit
        imgvRight.contentMode = UIView.ContentMode.center
        rightView             = imgvRight
        rightViewMode         = .always
        
        self.rightOffset = imgvRight.frame.size.width
    }
}

