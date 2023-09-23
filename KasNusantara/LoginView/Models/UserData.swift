//
//  UserData.swift
//  KasNusantara
//
//  Created by Awang Syukriansah Dirgantoro on 24/09/23.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class UserData: Identifiable {
    var id: String
    var name: String
    var email: String
    var password: String
    
    init(name: String, email: String, password: String) {
        self.id = UUID().uuidString
        self.name = name
        self.email = email
        self.password = password
    }
    
//    @Relationship()
    var transaction: [TransactionData] = []
}
