//
//  ViewController.swift
//  LifeAlbumBook
//
//  Created by dnlab on 12/14/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(signInButton)
        view.addSubview(registerButton)
        configureButtons() 
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let buttonSize: CGFloat = 100
        signInButton.frame = CGRect(x: (view.width-buttonSize)/2, y: (view.height-buttonSize)/2, width: buttonSize, height: 20)
        registerButton.frame = CGRect(x: (view.width-buttonSize)/2, y: signInButton.bottom+10, width: buttonSize, height: 20)
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

