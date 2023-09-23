//
//  CashFlowView.swift
//  KasNusantara
//
//  Created by Awang Syukriansah Dirgantoro on 28/09/23.
//

import SwiftUI
import SwiftData

struct CashFlowView: View {
    @Environment(\.modelContext) private var context
    @Query var dataUser: [UserData]
    @Binding var isShowCashFlowView: Bool
    @Binding var backgroundOffset: Int
    
    var body: some View {
        ZStack{
            VStack{
                Text("Detail Cash Flow")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding(.bottom)
                RoundedRectangle(cornerRadius: 30)
                    .fill(.ultraThinMaterial)
                    .overlay{
                        ScrollView{
                            VStack{
                                ForEach (dataUser) {
                                    data in
                                    if data.email == global.user {
                                        ForEach (data.transaction) {
                                            datas in
                                            ListView(nominal: .constant(datas.total), keterangan: .constant(datas.keterangan), status: .constant(datas.status), date: .constant(datas.date))
                                                .padding(.horizontal)
                                        }
                                    }
                                }
                            }.padding(.vertical)
                        }
                        .padding(.vertical)
                    }
                Button{
                    isShowCashFlowView = false
                }label: {
                    ButtonCustom(colorName: .constant(.red), text: .constant("Kembali"), isIcon: .constant(false))
                }
                .frame(height: 75)
            }
            .padding()
        }
        .onAppear{
            backgroundOffset = 80
        }
    }
}

#Preview {
    CashFlowView(isShowCashFlowView: .constant(true), backgroundOffset: .constant(60))
}
