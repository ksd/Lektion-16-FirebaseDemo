//
//  AuthState.swift
//  FirebaseDemo
//
//  Created by ksd on 21/03/2023.
//


import Foundation
import FirebaseAuth

final class AuthStateController: ObservableObject {
    
    @Published var user: User?
    
    func listenToAuthState() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else {
                return
            }
            self.user = user
        }
    }
    
    @MainActor
    func signIn(emailAddress: String, password: String) async {
      do {
        let authDataResult = try await Auth.auth().signIn(withEmail: emailAddress, password: password)
        let user = authDataResult.user
        
        print("Signed in as user \(user.uid), with email: \(user.email ?? "")")
        //self.isSignedIn = true
      }
      catch {
        print("There was an issue when trying to sign in: \(error)")
        //self.errorMessage = error.localizedDescription
      }
    }
    
    func signUp(emailAddress: String, password: String) {
        Auth.auth().createUser(withEmail: emailAddress, password: password) { result, error in
            if let error = error {
                print("an error occured: \(error.localizedDescription)")
                return
            }
            
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
