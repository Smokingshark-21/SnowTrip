//
//  UserViewModel.swift
//  SnowTrip
//
//  Created by Max Brockauf on 24.01.24.
//

import Foundation
import FirebaseAuth

class UserViewModel: ObservableObject {
    
    init() {
        checkAuth()
    }
    
    private var auth = Auth.auth()
    
    @Published var user: FireUser?
    
    
    var userIsLoggedIn: Bool {
        user != nil
    }
    
    private func checkAuth() {
        guard let currentUser = auth.currentUser else {
            print("Not logged in")
            return
        }
        self.fetchUser(with: currentUser.uid)
    }
    
    
    func login(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if let error {
                print("Login failed:", error.localizedDescription)
                return
            }
            
            guard let authResult, let email = authResult.user.email else { return }
            print("User with email '\(email)' is logged in with id '\(authResult.user.uid)'")
            
            self.fetchUser(with: authResult.user.uid)
        }
    }
    
    
    func register(email: String, password: String,name :String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if let error {
                print("Registration failed:", error.localizedDescription)
                return
            }
            
            guard let authResult, let email = authResult.user.email else { return }
            print("User with email '\(email)' is registered with id '\(authResult.user.uid)'")
            
            self.createUser(with: authResult.user.uid, email: email,name: name)
            
            self.login(email: email, password: password)
        }
    }
    
    
    func logout() {
        do {
            try auth.signOut()
            self.user = nil
            
            print("User wurde abgemeldet!")
        } catch {
            print("Error signing out: ", error.localizedDescription)
        }
    }
    
    // FireStore
    
    private func createUser(with id: String,email: String,name: String) {
        let user = FireUser(id: id,name: name, email: email, registeredAt: Date())
        
        do {
            try FirebaseManager.shared.database.collection("users").document(id).setData(from: user)
        } catch let error {
            print("Fehler beim Speichern des users: \(error)")
        }
    }
    
    
    private func fetchUser(with id: String) {
        FirebaseManager.shared.database.collection("users").document(id).getDocument{ document, error in
            if let error {
                print("Fetching user failed:",error.localizedDescription)
                return
            }
            
            guard let document else {
                print("Dokument existirt nicht!")
                return
            }
            
            do {
                let user = try document.data(as: FireUser.self)
                self.user = user
            } catch {
                print("Dokument ist kein User", error.localizedDescription)
            }
        }
    }
    
    
}
