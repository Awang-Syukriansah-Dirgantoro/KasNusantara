//
//  LoginController.swift
//  KasNusantara
//
//  Created by Awang Syukriansah Dirgantoro on 28/09/23.
//

import Foundation
import SwiftUI
import SwiftData

func addItem(context: ModelContext, data: UserData) {
    let item = data
    context.insert(item)
}

func deleteItem(context: ModelContext, data: UserData) {
    context.delete(data)
}
