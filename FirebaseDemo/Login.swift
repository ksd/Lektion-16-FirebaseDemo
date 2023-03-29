//
//  Login.swift
//  FirebaseDemo
//
//  Created by ksd on 21/03/2023.
//

import SwiftUI
import FirebaseAuth

struct Login: View {
    @State var emailAddress = ""
    @State var password = ""
    
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
                    Task{
                        await authController.signIn( emailAddress: emailAddress, password: password)
                    }
                },
                        label: {
                    Text("Login")
                        .bold()
                }
                )}
        }
        .navigationTitle("Sign Up")
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login().environmentObject(AuthStateController())
    }
}
