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
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.systemBrown.cgColor
        button.layer.cornerRadius = 25
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
        navigationController?.navigationBar.tintColor = .label
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
            y: (view.height)/4,
            width: titleLabel.width,
            height: titleLabel.height
        )
        
        let fieldHeight: CGFloat = 60
        
        emailField.frame = CGRect(
            x: 25,
            y: titleLabel.bottom+50,
            width: view.width-50,
            height: fieldHeight
        )
        
        passwordField.frame = CGRect(
            x: 25,
            y: emailField.bottom+10,
            width: view.width-50,
            height: fieldHeight
        )
        
        let buttonWidth: CGFloat = 300
        let buttonHeight: CGFloat = 50
        signInButton.frame = CGRect(
            x: (view.width-buttonWidth)/2,
            y: passwordField.bottom+60,
            width: buttonWidth,
            height: buttonHeight
        )
        registerButton.frame = CGRect(
            x: (view.width-buttonWidth)/2,
            y: signInButton.bottom+10,
            width: buttonWidth,
            height: buttonHeight
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
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        guard
            let email = emailField.text,
            let password = passwordField.text,
            !email.trimmingCharacters(in: .whitespaces).isEmpty,
            !password.isEmpty,
            password.count >= 6 else {
            return
        }
        
    }
    
    @objc private func didTapRegister() {
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

