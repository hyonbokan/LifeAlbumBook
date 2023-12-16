//
//  AuthManager.swift
//  LifeAlbumBook
//
//  Created by dnlab on 12/14/23.
//

import Foundation
import FirebaseAuth

class AuthManager {
    static let shared = AuthManager()
    
    private let auth = Auth.auth()
    
    public func signIn(
        email: String,
        password: String,
        completion: @escaping (Bool) -> Void
    ) {
        auth.signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                completion(false)
                print("Could not sign in")
                return
            }
            // Add database insertion
            completion(true)
        }
    }
    
    public func signUp(
        username: String,
        email: String,
        password: String,
        completion: @escaping (Bool) -> Void
    ) {
        auth.createUser(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                completion(false)
                return
            }
            // Add database insertion
            completion(true)
        }
    }
    
    public var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
}
