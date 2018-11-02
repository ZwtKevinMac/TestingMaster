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
class SBIButton: UIButton {
    
    //MARK: - Properties
    @IBInspectable dynamic open var borderColor: UIColor = .clear {
        
        didSet { updateBorderColor() }
    }
    
    @IBInspectable dynamic open var borderRadius: CGFloat = 0  {
        
        didSet { updateCornerRadius() }
    }
    
    @IBInspectable dynamic open var borderWidth: CGFloat = 0 {
        
        didSet { updateBorderWidth() }
    }
    
    @IBInspectable dynamic open var isUnderlineText: Bool = false {
        
        didSet { makeUnderLineText() }
    }
    
    //MARK: - Override Methods
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    }
    
    internal required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        clipsToBounds = true
    }
    
    override var isEnabled: Bool {
        
        didSet {
            
            if isEnabled { self.layer.borderColor = UIColor.white.cgColor } else {
                
                self.layer.borderColor = UIColor(
                    red: 255/255.0,
                    green: 255/255.0,
                    blue: 255/255.0,
                    alpha: 0.5
                    ).cgColor
            }
        }
    }
    
    //MARK: - Helper Methods
    private func updateBorderColor() {
        
        layer.borderColor = borderColor.cgColor
    }
    
    private func updateCornerRadius() {
        
        layer.cornerRadius = CGFloat(borderRadius)
    }
    
    private func updateBorderWidth() {
        
        layer.borderWidth = borderWidth
    }
    
    private func makeUnderLineText() {
        
        guard isUnderlineText else { return }
    
        guard let text = self.titleLabel?.text else { return }
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        
        self.setAttributedTitle(attributedString, for: .normal)
    }
    
    func shake() {
        
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}
