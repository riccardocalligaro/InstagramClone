//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by Riccardo on 03/01/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    private let logoView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "spiderman"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.textContentType = .username
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.isSecureTextEntry = true
        tf.textContentType = .password
        return tf
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    // MARK: - Helpers

    func configureUI() {
        navigationController?.navigationBar.isHidden = true
        
        // change the navbar style
        navigationController?.navigationBar.barStyle = .black
        
        // create the background layer
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        
        gradient.frame = view.frame
        
        // instagram logo
        view.addSubview(logoView)
        logoView.centerX(inView: view)
        logoView.setDimensions(height: 80, width: 120)
        logoView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
    }

}
