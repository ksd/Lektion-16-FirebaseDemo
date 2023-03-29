//
//  Item.swift
//  FirebaseDemo
//
//  Created by ksd on 17/03/2023.
//

import Foundation
import FirebaseFirestoreSwift

struct Item: Codable, Identifiable {
    @DocumentID var id: String?
    let name: String
    var amount = 1
}
