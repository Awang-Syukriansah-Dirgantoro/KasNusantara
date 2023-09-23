//
//  TransactionData.swift
//  KasNusantara
//
//  Created by Awang Syukriansah Dirgantoro on 02/10/23.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class TransactionData: Identifiable{
    var id: String
    var total: Int
    var date: Date
    var status: String
    var keterangan: String
    
    init(total: Int, date: Date, status: String, keterangan: String) {
        self.id = UUID().uuidString
        self.total = total
        self.date = date
        self.status = status
        self.keterangan = keterangan
    }
}
