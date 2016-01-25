//
//  FlatTextField.swift
//  iChat
//
//  Created by PROTECO on 25/01/16.
//  Copyright © 2016 PROTECO. All rights reserved.
//

import UIKit
@IBDesignable
class FlatTextField: UITextField,UITextFieldDelegate {
        
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupView()
    }
    
    override func prepareForInterfaceBuilder() {
            super.prepareForInterfaceBuilder()
            setupView()
    }
        
        
    func setupView(){
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        self.leftView = leftView
        self.leftViewMode = .Always
        self.delegate = self
    }
  
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.resignFirstResponder()
        return true
    }
}
