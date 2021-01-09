//
//  Button+AttributedText.swift
//  InstagramClone
//
//  Created by Riccardo on 09/01/21.
//

import Foundation
import UIKit

extension UIButton {
    func attributedTitle(firstPart: String, secondPart: String) {
        let normalText: [NSAttributedString.Key : Any] = [
            .foregroundColor: UIColor(white: 1, alpha: 0.7),
            .font: UIFont.systemFont(ofSize: 16)
        ]
        
        let boldText: [NSAttributedString.Key : Any] = [
            .foregroundColor: UIColor(white: 1, alpha: 0.7),
            .font: UIFont.boldSystemFont(ofSize: 16)
        ]
    
        let title = NSMutableAttributedString(string: "Don't have an account? ", attributes: normalText)
        title.append(NSAttributedString(string: "Sign up", attributes: boldText))
        
        setAttributedTitle(title, for: .normal)
    }
}
