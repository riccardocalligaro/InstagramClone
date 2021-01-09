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
        let iv = UIImageView(image: #imageLiteral(resourceName: "instagram_logo"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let emailTextField = BaseTextField(placeholder: "Email", type: .emailAddress)
    private let passwordTextField = BaseTextField(placeholder: "Password", type: .password, secure: true)
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 8
        button.setHeight(50)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        return button
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Don't have an account? ", secondPart: "Sign up")

        return button
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Forgot your password? ", secondPart: "Tap here to reset it")
        return button
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
        logoView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 48)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton, forgotPasswordButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        
        view.addSubview(stackView)
        stackView.anchor(top: logoView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 48, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(registerButton)
        registerButton.centerX(inView: view)
        registerButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
        
    }

}
