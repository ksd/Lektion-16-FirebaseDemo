//
//  FirebaseDemoApp.swift
//  FirebaseDemo
//
//  Created by ksd on 17/03/2023.
//

import SwiftUI
import FirebaseCore

@main
struct FirebaseDemoApp: App {
    
    @StateObject var stateController = StateController()
    @StateObject var authController = AuthStateController()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ContentView()
            }
            .environmentObject(stateController)
            .environmentObject(authController)
        }
    }
}


