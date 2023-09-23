//
//  DatePickerView.swift
//  KasNusantara
//
//  Created by Awang Syukriansah Dirgantoro on 02/10/23.
//

import SwiftUI

struct DatePickerView: View {
    @Binding var birthDate: Date
    @State var shadow = 0
    
    var body: some View {
        VStack {
            DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
                Text("Select a date")
            }
        }
        .padding(.horizontal)
        .background{
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .border(.clear)
                .shadow(color: shadow == 0 ? .white : .gray, radius: CGFloat(shadow))
        }
    }
}

#Preview {
    DatePickerView(birthDate: .constant(Date.now))
}
