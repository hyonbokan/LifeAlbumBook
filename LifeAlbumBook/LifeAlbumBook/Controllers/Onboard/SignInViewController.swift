//
//  ViewController.swift
//  LifeAlbumBook
//
//  Created by dnlab on 12/14/23.
//

import UIKit

class SignInViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Welcome"
        title.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        title.textColor = .white
        title.textAlignment = .center
        return title
    }()
    
    private let emailField: TextField = {
        let textField = TextField()
        textField.placeholder = "Email Address"
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .next
        textField.autocorrectionType = .no
        return textField
    }()
    
    private let passwordField: TextField = {
        let textField = TextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.keyboardType = .default
        textField.returnKeyType = .continue
        textField.autocorrectionType = .no
        return textField
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkerFelt-Wide", size: 25)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkerFelt-Wide", size: 25)
        return button
    }()
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "onboard_main")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        addSubviews()
        configureButtons()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        backgroundImage.frame = view.bounds
        
        titleLabel.sizeToFit()
        let titleX = (view.width - titleLabel.width) / 2
        titleLabel.frame = CGRect(
            x: titleX,
            y: view.safeAreaInsets.top+20,
            width: titleLabel.width,
            height: titleLabel.height
        )
        
        let fieldHeight: CGFloat = 60
        
        emailField.frame = CGRect(
            x: 25,
            y: (view.height-fieldHeight)/2,
            width: view.width-50,
            height: fieldHeight
        )
        
        passwordField.frame = CGRect(
            x: 25,
            y: emailField.bottom+10,
            width: view.width-50,
            height: fieldHeight
        )
        
        let buttonSize: CGFloat = 300
        signInButton.frame = CGRect(
            x: (view.width-buttonSize)/2,
            y: passwordField.bottom+20,
            width: buttonSize,
            height: 40
        )
        registerButton.frame = CGRect(
            x: (view.width-buttonSize)/2,
            y: signInButton.bottom+10,
            width: buttonSize,
            height: 40
        )
    }
    
    private func addSubviews() {
        view.addSubview(signInButton)
        view.addSubview(registerButton)
        view.addSubview(backgroundImage)
        view.addSubview(titleLabel)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.sendSubviewToBack(backgroundImage)
    }
    
    private func configureButtons() {
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
    }
    
    @objc private func didTapSignIn() {
        AuthManager.shared.signIn(email: "testAcc", password: "123123123") { result in
            if result {
                print("\nsign in success!\n")
            } else {
                print("\nCould not sign in\n")
            }
        }
    }
    
    @objc private func didTapRegister() {
        AuthManager.shared.signUp(username: "username", email: "testAcc@gmail.com", password: "123123123") { result in
            if result {
                print("\nUser registered\n")
            } else {
                print("\nCould not register the user\n")
            }
        }
    }


}
