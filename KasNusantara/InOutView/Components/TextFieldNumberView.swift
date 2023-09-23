//
//  TextFieldNumberView.swift
//  KasNusantara
//
//  Created by Awang Syukriansah Dirgantoro on 03/10/23.
//

import SwiftUI

struct TextFieldNumberView: View {
    @Binding var text : String
    @Binding var placeHolder : String
    @Binding var icon : String
//    @Binding var isSecure : Bool
    @State private var isEditing: Bool = false
    @FocusState var isFocused : Bool
    @State var shadow = 0
    
    var body: some View {
        //        VStack(alignment: .leading) {
        ////            Text("Illusion Custom TextField Style").font(.title2)
        //            HStack {
        //                TextField("", text: $text).extensionTextFieldView(roundedCornes: 29, startColor: .white.opacity(1), endColor: .blue.opacity(1))
        //            }
        //        }.padding()
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: icon)
//                if placeHolder == "Password" {
//                    SecureField(placeHolder, text: $text, onCommit: { isEditing = false })
//                        .focused($isFocused)
//                        .onTapGesture {
////                                    isFocused = true
//                            print(isFocused)
//                            if isFocused {
//                                print("TextField focused")
//                                withAnimation (Animation.easeInOut (duration: 0.3)){
//                                    shadow = 10
//                                }
//                            } else {
//                                print("TextField focus removed")
//                                withAnimation (Animation.easeInOut (duration: 0.3)){
//                                    shadow = 0
//                                }
//                            }
//                                }
//                } else {
                    TextField(placeHolder, text: $text, onEditingChanged: {
                        (editingChanged) in
                        if editingChanged {
                            print("TextField focused")
                            isEditing = false
                            withAnimation (Animation.easeInOut (duration: 0.3)){
                                shadow = 10
                            }
                        } else {
                            print("TextField focus removed")
                            withAnimation (Animation.easeInOut (duration: 0.3)){
                                shadow = 0
                            }
                        }
                    })
//                }
            }.underlineTextField()
                .padding()
        }
        .background{
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .border(.clear)
                .shadow(color: shadow == 0 ? .white : .gray, radius: CGFloat(shadow))
        }
    }
}

#Preview {
    TextFieldNumberView(text: .constant(""), placeHolder: .constant("Password"), icon: .constant("envelope.fill"))
}
