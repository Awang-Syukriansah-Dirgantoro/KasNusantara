//
//  ProfileView.swift
//  KasNusantara
//
//  Created by Awang Syukriansah Dirgantoro on 28/09/23.
//

import SwiftUI
import SwiftData

struct ProfileView: View {
    @Environment(\.modelContext) private var context
    @Query var dataUser: [UserData]
    @Binding var isShowProvileView: Bool
    @Binding var backgroundOffset: Int
    @State var textPass = ""
    
    var body: some View {
        ZStack{
            VStack{
                Text("Detail Cash Flow")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding(.bottom)
                VStack(alignment: .leading){
                    Text("Ganti Password")
                        .font(.title2)
                        .bold()
                        .padding()
                    Text("Password Lama")
                        .font(.title3)
                        .bold()
                        .padding(.horizontal)
                    ForEach (dataUser) {
                        data in
                        if data.email == global.user {
                            TextBoxView(text: .constant(data.password), placeHolder: .constant("Nominal"), icon: .constant("lock.fill"))
                                .padding(.bottom)
                        }
                    }
                    Text("Password baru")
                        .font(.title3)
                        .bold()
                        .padding(.horizontal)
                    TextBoxView(text: $textPass, placeHolder: .constant("Nominal"), icon: .constant("lock.fill"))
                        .padding(.bottom)
                    Button{
                        for data in dataUser {
                            if data.email == global.user {
                                data.password = textPass
                            }
                        }
                        textPass = ""
                    }label: {
                        ButtonCustom(colorName: .constant(.green), text: .constant("Simpan"), isIcon: .constant(false))
                    }
                    .frame(height: 75)
                    .padding(.horizontal)
                    Button{
                        isShowProvileView = false
                    }label: {
                        ButtonCustom(colorName: .constant(.red), text: .constant("Kembali"), isIcon: .constant(false))
                    }
                    .frame(height: 75)
                    .padding(.horizontal)
                }
                Spacer()
                HStack{
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .fill(.clear)
                        .frame(width: 130,height: 200)
                        .overlay{
                            Image("DSC02204")
                                .resizable()
                                .scaledToFill()
                        }
                    VStack(alignment: .leading){
                        Text("Aplikasi ini dibuat oleh").bold()
                        Text("Awang Syukriansah Dirgantoro").bold()
                        Text("1941720065").bold()
                    }
                }
            }
        }
        .onAppear{
            backgroundOffset = 60
        }
    }
}

#Preview {
    ProfileView(isShowProvileView: .constant(true), backgroundOffset: .constant(60))
}
