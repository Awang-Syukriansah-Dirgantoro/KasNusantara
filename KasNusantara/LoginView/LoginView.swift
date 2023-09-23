//
//  LoginView.swift
//  KasNusantara
//
//  Created by Awang Syukriansah Dirgantoro on 23/09/23.
//

import SwiftUI
import SwiftData

struct LoginView: View {
    @Environment(\.modelContext) private var context
    @Query var dataUser: [UserData]
    @State var sizeLogo = 100
    @State var backLogo = 400
    @State var placeHolderEmail = "Email"
    @State var placeHolderPass = "Password"
    @State var textEmail = ""
    @State var textPass = ""
    @State var iconEmail = "envelope.fill"
    @State var iconPass = "lock.fill"
    @State var isWrongLogin = false
    @State var wrongStatus = ""
    @Binding var backgroundOffset: Int
    
    @Binding var isLogin: Bool
//    @Binding var dataUser: [UserData]
    
    var body: some View {
        ZStack{
            VStack{
                RoundedRectangle(cornerRadius: 30)
                    .fill(.ultraThinMaterial.opacity(0))
                    .frame(height: 200)
                    .padding(.horizontal)
                    .overlay(content: {
                        VStack{
                            LogoView(size: $sizeLogo)
                                .shadow(color: .white,radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            Text("Kas Nusantara")
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                .font(.largeTitle)
                                .bold()
                                .shadow(color: .white,radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        }
                    })
                RoundedRectangle(cornerRadius: 30)
                    .fill(.ultraThinMaterial.opacity(0))
                    .frame(height: 400)
                    .padding()
                    .overlay{
                        VStack{
                            if isWrongLogin {
                                Text(wrongStatus)
                                    .foregroundColor(.red)
                                    .font(.title)
                                    .bold()
                            }
                            TextBoxView(text: $textEmail, placeHolder: $placeHolderEmail, icon: $iconEmail)
                                .padding(.bottom)
                            TextBoxView(text: $textPass, placeHolder: $placeHolderPass, icon: $iconPass)
                        }
                        .padding()
                    }
                Button {
                    //                    let data = UserData(name: "", email: textEmail, password: textPass)
                    //                    addItem(context: context, data: data)
                    
//                                        do{
//                                            try context.delete(model: UserData.self)
//                                        } catch {
//                                            print(error)
//                                        }
                    for datas in dataUser {
                        if datas.email == textEmail {
                            if datas.password == textPass {
                                isLogin = true
                                global.user = textEmail
                            } else {
                                isWrongLogin = true
                                wrongStatus = "User not found"
                            }
                        } else {
                            isWrongLogin = true
                            wrongStatus = "User not found"
                        }
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.ultraThinMaterial.opacity(0))
                        .frame(height: 100)
                        .padding(.horizontal)
                        .overlay{
                            ButtonLoginView()
                                .padding()
                        }
                }
            }
        }
        .onAppear{
            backgroundOffset = 0
//            if dataUser.isEmpty {
//                let data = UserData(name: "User", email: "User@User", password: "User")
//                addItem(context: context, data: data)
//            }
//            for index in dataUser {
//                if index.name != "User" {
//                    let data = UserData(name: "User", email: "User@User", password: "User")
//                    addItem(context: context, data: data)
//                }
//            }
        }
    }
}

#Preview {
    LoginView(backgroundOffset: .constant(0), isLogin: .constant(false))
}
