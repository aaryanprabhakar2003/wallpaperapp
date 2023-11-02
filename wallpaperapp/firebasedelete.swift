//
//  firebasedelete.swift
//  wallpaperapp
//
//  Created by Aaryan Prabhakar on 30/10/23.
//

import Foundation
import Firebase
import FirebaseAuth
class AuthManager:ObservableObject {
    static let shared = AuthManager()

    func deleteAccount(completion: @escaping (Error?) -> Void) {
        guard let user = Auth.auth().currentUser else {
            completion(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No user logged in"]))
            return
        }
        
        user.delete { error in
            completion(error)
        }
    }
}
