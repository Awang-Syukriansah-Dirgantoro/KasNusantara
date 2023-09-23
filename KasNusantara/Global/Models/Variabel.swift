//
//  Variabel.swift
//  KasNusantara
//
//  Created by Awang Syukriansah Dirgantoro on 01/10/23.
//

import Foundation
import SwiftUI
import SwiftData

class Global {
    @Published var user = ""
    
    init(user: String = "") {
        self.user = user
    }
}
