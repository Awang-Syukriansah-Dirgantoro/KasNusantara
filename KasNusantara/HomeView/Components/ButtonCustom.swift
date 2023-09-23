//
//  ButtonCustom.swift
//  KasNusantara
//
//  Created by Awang Syukriansah Dirgantoro on 01/10/23.
//

import SwiftUI

struct ButtonCustom: View {
    @Binding var colorName: Color
    @Binding var text: String
    @Binding var isIcon: Bool
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(colorName)
            .overlay{
                if isIcon{
                    Image(systemName: text)
                        .foregroundStyle(.white)
                        .bold()
                        .font(.system(size: 30))
                } else {
                    Text(text)
                        .foregroundColor(.white)
                        .bold()
                    //                        .italic()
                        .font(.system(size: 30))
                }
            }
    }
}


#Preview {
    ButtonCustom(colorName: .constant(.blue), text: .constant("Login"), isIcon: .constant(false))
}
