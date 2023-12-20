//
//  Database.swift
//  LifeAlbumBook
//
//  Created by Michael Kan on 2023/12/19.
//

import Foundation
import FirebaseFirestore

class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Firestore.firestore()
    
    public func insertUser(user: User, completion: @escaping (Bool) -> Void) {
        let ref = database.document("users/\(user.username)")
        guard let newUser = user.asDictionary() else {
            completion(false)
            return
        }
        ref.setData(newUser) { error in
            completion(error==nil)
        }
    }
    
    public func findUsername(username: String, completion: @escaping (User?) -> Void) {
        let ref = database.collection("users")
        ref.getDocuments { snapshot, error in
            guard let users = snapshot?.documents.compactMap({ User(with: $0.data()) }) else {
                completion(nil)
                return
            }
            let user = users.first(where: { $0.username == username })
            completion(user)
        }
    }
    
}
