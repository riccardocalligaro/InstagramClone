//
//  RegistrationViewController.swift
//  InstagramClone
//
//  Created by Riccardo on 09/01/21.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    // MARK: - Properties
    private let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 81)
        button.setImage(UIImage(systemName: "pencil.circle", withConfiguration: symbolConfig), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let usernameTextField = BaseTextField(placeholder: "Username", type: .username)
    
    private let emailTextField = BaseTextField(placeholder: "Email", type: .emailAddress)
    
    private let passwordTextField = BaseTextField(placeholder: "Password", type: .newPassword, secure: true)
    private let confirmPasswordTextField = BaseTextField(placeholder: "Confirm password", type: .newPassword, secure: true)
    
    private let signUpButton: UIButton = {
        let button = AuthenticationButton(title: "Sign Up")
        return button
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.attributedTitle(firstPart: "Already have an account?", secondPart: "Log in")
        button.addTarget(self, action: #selector(handleSignInAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Actions
    
    @objc private func handleSignInAction() {
        if let vcs = self.navigationController?.viewControllers {
            if vcs.count >= 2 {
                let previousVC = vcs[vcs.count - 2]
                if previousVC is LoginViewController {
                    navigationController?.popViewController(animated: true)
                } else {
                    goToLogin()
                }
            } else {
                goToLogin()
            }
        }
    }
    
    private func goToLogin() {
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    // MARK: - Helpers
    private func configureUI() {
        applyGradientBackground()
        
        navigationController?.navigationBar.isHidden = true
        
        // change the navbar style
        navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(plusPhotoButton)
        
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 48)
        
        let stackView = UIStackView(arrangedSubviews: [usernameTextField,emailTextField, passwordTextField, confirmPasswordTextField, signUpButton])
        
        stackView.axis = .vertical
        stackView.spacing = 16
        
        view.addSubview(stackView)
        
        stackView.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(signInButton)
        
        signInButton.centerX(inView: view)
        signInButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
        
        
    }
    
}
