//
//  AddItemView.swift
//  FirebaseDemo
//
//  Created by ksd on 22/03/2023.
//

import SwiftUI

struct AddItemView: View {
    
    @State private var name = ""
    @State private var value = 1
    
    @EnvironmentObject var stateController: StateController
    @Environment(\.dismiss) private var dismiss
    
    func incrementStep() {
        if value < 15 {
            value += 1
        }
    }
    
    func decrementStep() {
        if value > 0 {
            value -= 1
        }
    }
    
    func add(){
        stateController.add(item: .init(name: name, amount: value))
    }
    
    var body: some View {
        Form{
            Section(header: Text("Vare oplysninger")){
                TextField("Navn", text: $name, prompt: Text("Skriv navnet på emnet"))
                HStack {
                    Stepper {
                        Text("Antal: \(value)")
                    } onIncrement: {
                        incrementStep()
                    } onDecrement: {
                        decrementStep()
                    }
                }
            }
            Section{
                HStack {
                    Button("Annuller") {
                        dismiss()
                    }
                    Spacer()
                    Button {
                        add()
                        dismiss()
                    } label: {
                        Text("Opret vare")
                    }
                }
            }
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
