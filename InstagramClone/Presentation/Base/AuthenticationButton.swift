//
//  AuthenticationButton.swift
//  InstagramClone
//
//  Created by Riccardo on 10/01/21.
//

import Foundation
import UIKit

class AuthenticationButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        backgroundColor = .systemPurple
        layer.cornerRadius = 8
        setHeight(50)
        titleLabel?.font = .boldSystemFont(ofSize: 16)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
