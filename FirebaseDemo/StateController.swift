//
//  StateController.swift
//  FirebaseDemo
//
//  Created by ksd on 17/03/2023.
//

import SwiftUI

class StateController: ObservableObject {
    @Published var shoppingList: [Item] = []
    
    private let FBService = FirebaseService()
    
    init(){
        FBService.listenForItems { items in
            self.shoppingList = items
        }
    }
    
    func add(item: Item){
        FBService.add(item: item)
    }
    
    func delete(item: Item){
        FBService.delete(item: item)
    }
}
