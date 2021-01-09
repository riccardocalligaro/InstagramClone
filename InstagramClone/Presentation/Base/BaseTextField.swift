//
//  BaseTextField.swift
//  InstagramClone
//
//  Created by Riccardo on 09/01/21.
//

import UIKit

class BaseTextField: UITextField {
    
    init(placeholder: String, type: UITextContentType, secure: Bool = false) {
        super.init(frame: .zero)
        
        let spacer = UIView()
        spacer.setDimensions(height: 50, width: 12)
        leftView = spacer
        leftViewMode = .always
        
        textColor = .white
        textContentType = type
        isSecureTextEntry = secure
        keyboardAppearance = .dark
        
        
        backgroundColor = UIColor(white: 1, alpha: 0.1)
        setHeight(50)
        
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
            .foregroundColor: UIColor(white: 1, alpha: 0.7)
        ])
        
        layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
