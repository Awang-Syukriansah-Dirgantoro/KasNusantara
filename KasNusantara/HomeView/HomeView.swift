//
//  HomeView.swift
//  KasNusantara
//
//  Created by Awang Syukriansah Dirgantoro on 28/09/23.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var context
    @Query var dataUser: [UserData]
    @State var isShowInOutView = false
    @State var isShowCashFlowView = false
    @State var isShowProfileView = false
    @State var isIn = true
    @State var totalPengeluaran = 0
    @State var totalPemasukan = 0
    
    @Binding var backgroundOffset: Int
    
    var body: some View {
        ZStack{
            if isShowInOutView {
                InOutView(isIn: $isIn, isShowInOutView: $isShowInOutView, backgroundOffset: $backgroundOffset)
            } else if isShowCashFlowView {
                CashFlowView(isShowCashFlowView: $isShowCashFlowView, backgroundOffset: $backgroundOffset)
            } else if isShowProfileView {
                ProfileView(isShowProvileView: $isShowProfileView, backgroundOffset: $backgroundOffset)
            } else {
                VStack{
                    Text("Rangkuman Pengeluaran")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .padding(.bottom)
                    Spacer()
                    Text("Pengeluaran : \(totalPengeluaran)")
                        .bold()
                    Text("Pemasukan   : \(totalPemasukan)")
                        .bold()
                        .padding(.bottom)
                    Spacer()
//                    ButtonCustom(colorName: .constant(.red), text: .constant("bagian atas"), isIcon: .constant(false))
                    HStack{
                        Button{
                            isShowInOutView = true
                            isIn = true
                            totalPemasukan = 0
                            totalPengeluaran = 0
                        }label: {
                            ButtonCustom(colorName: .constant(.green), text: .constant("Tambah Pemasukan"), isIcon: .constant(false))
                        }
                        .frame(height: 200)
                        Button{
                            isShowInOutView = true
                            isIn = false
                            totalPemasukan = 0
                            totalPengeluaran = 0
                        }label: {
                            ButtonCustom(colorName: .constant(.red), text: .constant("Tambah Pengeluaran"), isIcon: .constant(false))
                        }
                        .frame(height: 200)
                    }
                    HStack{
                        Button{
                            isShowCashFlowView = true
                            totalPemasukan = 0
                            totalPengeluaran = 0
                        }label: {
                            ButtonCustom(colorName: .constant(.orange), text: .constant("Detail Cash Flow"), isIcon: .constant(false))
                        }
                        .frame(height: 200)
                        Button{
                            isShowProfileView = true
                            totalPemasukan = 0
                            totalPengeluaran = 0
                        }label: {
                            ButtonCustom(colorName: .constant(.gray), text: .constant("Pengaturan"), isIcon: .constant(false))
                        }
                        .frame(height: 200)
                    }
                }
                .padding()
                .onAppear{
                    backgroundOffset = 150
                    for data in dataUser {
                        if data.email == global.user {
                            for datas in data.transaction {
                                if datas.status == "masuk" || datas.status == "in" {
                                    totalPemasukan += datas.total
                                } else {
                                    totalPengeluaran += datas.total
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView(backgroundOffset: .constant(150))
}
