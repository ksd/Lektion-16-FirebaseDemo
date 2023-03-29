//
//  FirebaseService.swift
//  FirebaseDemo
//
//  Created by ksd on 17/03/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirebaseService {
    private let dbRef = Firestore.firestore()
    lazy var collectionRef = dbRef.collection("shoppingList")
    
    func add(item: Item){
        do {
            let newDocumentReference = try collectionRef.addDocument(from: item)
            print("ID: \(newDocumentReference.documentID)")
        }catch {
            print(error)
        }
    }
    
    func delete(item: Item){
        guard let id = item.id else { return }
        collectionRef.document(id).delete()
        print("\(String(describing: item)) er nu slettet")
    }
    
    
    func listenForItems(_ completionHandler: @escaping ([Item])->Void){
        collectionRef.addSnapshotListener { querySnapshot, error in
            if error != nil {
                print(String(describing: error))
                return
            }
            guard let documents = querySnapshot?.documents else {return}
            let items = documents.compactMap { (queryDocumentSnapshot) -> Item? in
                return try? queryDocumentSnapshot.data(as: Item.self)
            }
            completionHandler(items)
        }
    }
}

