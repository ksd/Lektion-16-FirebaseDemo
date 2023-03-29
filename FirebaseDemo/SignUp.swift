//
//  SignUp.swift
//  FirebaseDemo
//
//  Created by ksd on 21/03/2023.
//

import SwiftUI

struct SignUp: View {
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    @EnvironmentObject var authController: AuthStateController
    
    var body: some View {
        Form {
            Section {
                TextField("Email", text: $emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .keyboardType(.emailAddress)
                SecureField("Password", text: $password)
                    .textContentType(.password)
                    .keyboardType(.default)
            }
            Section {
                Button( action: {
                    authController.signUp( emailAddress: emailAddress, password: password) },
                        label: {
                    Text("Sign Up")
                        .bold()
                }
                )}
        }
        .navigationTitle("Sign Up")
        
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SignUp()
                .environmentObject(AuthStateController())
        }
    }
}


