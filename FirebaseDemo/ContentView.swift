//
//  ContentView.swift
//  FirebaseDemo
//
//  Created by ksd on 17/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var stateController: StateController
    @State private var showAdd = false
    @State private var showDelete = false
    @State private var deleteItem: Item?
    
    var sortedList: [Item] {
        stateController.shoppingList.sorted{ $0.name < $1.name}
    }
    
    var body: some View {
        
        List {
            ForEach(sortedList) { item in
                Text(item.name)
            }
            .onDelete { indexSet in
                showDelete = true
                deleteItem = sortedList[indexSet.first!]
            }
        }
        .navigationTitle("Indkøbsliste")
        .navigationBarItems(trailing: Button(action: {
            showAdd = true
        }, label: {
            Image(systemName: "plus")
        }))
        .sheet(isPresented: $showAdd) {
            AddItemView()
        }
        .alert(isPresented: $showDelete) {
            Alert(
                title: Text("Er du sikker på du vil slette \(deleteItem?.name ?? "dette")?"),
                message: Text("Dette kan ikke fortrydes"),
                primaryButton: .destructive(Text("Delete")) {
                    if let deleteItem {
                        stateController.delete(item: deleteItem)
                        self.deleteItem = nil
                    }
                },
                secondaryButton: .cancel()
            )
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ContentView()
        }
        .environmentObject(StateController())
    }
}
