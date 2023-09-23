//
//  LogoView.swift
//  KasNusantara
//
//  Created by Awang Syukriansah Dirgantoro on 23/09/23.
//

import SwiftUI

struct LogoView: View {
    @Binding var size: Int
    
    var body: some View {
        ZStack{
            Image(systemName: "arrowshape.turn.up.left.2")
                .resizable()
                .scaledToFit()
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .frame(height: CGFloat(size))
                .rotationEffect(Angle(degrees: 140))
                .offset(x: CGFloat(size)/3.3,y: CGFloat(size)/5)
            Image(systemName: "arrowshape.turn.up.left.2")
                .resizable()
                .scaledToFit()
                .foregroundColor(.red)
                .frame(height: CGFloat(size))
                .rotationEffect(Angle(degrees: -40))
                .offset(x: -CGFloat(size)/3.3,y: CGFloat(-size/5))
        }
        .padding()
    }
}

#Preview {
    LogoView(size: .constant(100))
}
