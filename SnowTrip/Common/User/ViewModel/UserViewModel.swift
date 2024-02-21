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
    
    
    func register(email: String, password: String,name: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if let error {
                print("Registration failed:", error.localizedDescription)
                return
            }
            
            guard let authResult, let email = authResult.user.email else { return }
            print("User with email '\(email)' is registered with id '\(authResult.user.uid)'")
            
            self.createUser(with: authResult.user.uid, email: email,name: name, pass: password)
            
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
    
    private func createUser(with id: String,email: String,name: String,pass:String) {
        let user = FireUser(id: id, freundesCode: freundesCodegen() ,name: name, password: pass , email: email, registeredAt: Date(),savedressort: [],widgets: [],gps: [], friends: [])
        
        do {
            try FirebaseManager.shared.database.collection("users").document(id).setData(from: user)
        } catch let error {
            print("Fehler beim Speichern des users: \(error)")
        }
    }
    
    
    func saveRessort(with ressortadd: [Ressort],widget: [Widget]) {
        guard var user = user else {
            print("Fehler: Der Benutzer ist nil.")
            return
        }
               
            user.savedressort = ressortadd
            user.widgets = widget
    
        do {
            try FirebaseManager.shared.database.collection("users").document(user.id).setData(from: user,merge : true)
        } catch let error {
            print("Fehler beim Speichern des Users: \(error)")
        }
    }
    
    func saveFriend(with Friend: [Friend]) {
        guard var user = user else {
            print("Fehler: Der Benutzer ist nil.")
            return
        }
               
        user.friends = Friend
    
        do {
            try FirebaseManager.shared.database.collection("users").document(user.id).setData(from: user,merge : true)
        } catch let error {
            print("Fehler beim Speichern des Users: \(error)")
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
    // GPS Freunde
    
    private func freundesCodegen() -> String {
        var code: String

        repeat {
            code = String(format: "%05d", Int.random(in: 0..<100000))
        } while checkIfFriendCodeExists(code)

        return code
    }

    private func checkIfFriendCodeExists(_ code: String) -> Bool {
        var codeExists = false

        FirebaseManager.shared.database.collection("users").whereField("friendCode", isEqualTo: code).getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Fehler beim Abrufen der Daten: \(error)")
            } else {
                codeExists = !querySnapshot!.isEmpty
            }
        }

        return codeExists
    }
    
    
     func getFriendIfFriendCodeExists(_ code: String, completion: @escaping (Friend?) -> Void) {
        FirebaseManager.shared.database.collection("users").whereField("freundesCode", isEqualTo: code).getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Fehler beim Abrufen der Daten: \(error)")
                completion(nil)
                return
            }

            guard let document = querySnapshot?.documents.first else {
                completion(nil)
                return
            }

            do {
                let friendId = document.documentID
                let friendName = document["name"] as? String

                let gpsdaten = document["gps"] as? [Gpsdaten] ?? []

                let friend = Friend(id: friendId, name: friendName ?? "", gps: gpsdaten)
                
                completion(friend)
            } catch {
                print("Fehler beim Extrahieren der Daten: \(error)")
                completion(nil)
            }
        }
    }
    
    
}
