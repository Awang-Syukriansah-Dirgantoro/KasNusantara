//
//  ContentView.swift
//  KasNusantara
//
//  Created by Awang Syukriansah Dirgantoro on 23/09/23.
//

import SwiftUI
<<<<<<< HEAD

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
=======
import SwiftData

var global = Global()

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query var dataUser: [UserData]
    @State var backgroundOffset = 0
    @State var offsiteAnimation = 0
    
    @State var isLogin = false
    var body: some View {
        ZStack{
            VStack{
                Rectangle()
                    .fill(.cyan)
                    .ignoresSafeArea()
                    .frame(height: backgroundOffset >= 200 ? 580 : 500)
                Rectangle()
                    .fill(.white)
            }
            Capsule()
                .fill(.white)
                .offset(y: CGFloat(offsiteAnimation))
            if isLogin {
                HomeView(backgroundOffset: $backgroundOffset)
            } else {
                LoginView(backgroundOffset: $backgroundOffset, isLogin: $isLogin)
            }
//            VStack{
//                ForEach (dataUser) {
//                    data in
//                    Text(data.email)
//                    ForEach (data.transaction) {
//                        datas in
//                        Text(datas.status)
//                        Text(String(datas.total))
//                    }
//                }
//            }
        }
        .onChange(of: backgroundOffset){
            withAnimation (Animation.easeInOut (duration: 0.3)){
                offsiteAnimation = backgroundOffset
            }
        }
>>>>>>> aba7f9b (Initial Commit)
    }
}

#Preview {
    ContentView()
}
