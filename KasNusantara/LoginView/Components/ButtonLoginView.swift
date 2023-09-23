//
//  ButtonLoginView.swift
//  KasNusantara
//
//  Created by Awang Syukriansah Dirgantoro on 24/09/23.
//

import SwiftUI

struct ButtonLoginView: View {
    var body: some View {
        
        RoundedRectangle(cornerRadius: 30)
            .fill(.blue)
            .padding(.horizontal)
            .overlay{
                Text("Login")
                    .foregroundColor(.white)
                    .bold()
                //                        .italic()
                    .font(.system(size: 30))
            }
    }
}

#Preview {
    ButtonLoginView()
}
