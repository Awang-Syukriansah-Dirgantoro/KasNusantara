//
//  InOutView.swift
//  KasNusantara
//
//  Created by Awang Syukriansah Dirgantoro on 28/09/23.
//

import SwiftUI
import SwiftData

struct InOutView: View {
    @Environment(\.modelContext) private var context
    @Query var dataUser: [UserData]
    @State var birthDate = Date.now
    @State var textNominal = ""
    @State var textKeterangan = ""
    @Binding var isIn: Bool
    @Binding var isShowInOutView: Bool
    @Binding var backgroundOffset: Int
    
    var body: some View {
        ZStack{
            VStack{
                if isIn {
                    Text("Tambah Pemasukan")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                } else {
                    Text("Tambah Pengeluaran")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                }
                TextBoxView(text: $textNominal, placeHolder: .constant("Nominal"), icon: .constant("dollarsign"))
                    .padding(.bottom)
                TextBoxView(text: $textKeterangan, placeHolder: .constant("Keterangan"), icon: .constant("doc.plaintext"))
                    .padding(.bottom)
                DatePickerView(birthDate: $birthDate)
                    .padding(.bottom)
                Spacer()
                Button{
                    for data in dataUser {
                        if data.email == global.user {
                            data.transaction.append(TransactionData(total: Int(textNominal) ?? 0, date: birthDate, status: isIn ? "in" : "out", keterangan: textKeterangan))
                        }
                    }
                    print("Masuk Sini ",global.user)
                }label: {
                    ButtonCustom(colorName: .constant(.green), text: .constant("Simpan"), isIcon: .constant(false))
                }
                .frame(height: 75)
                Button{
                    textNominal = ""
                    textKeterangan = ""
                    birthDate = Date.now
                }label: {
                    ButtonCustom(colorName: .constant(.orange), text: .constant("Reset"), isIcon: .constant(false))
                }
                .frame(height: 75)
                Button{
                    isShowInOutView = false
                }label: {
                    ButtonCustom(colorName: .constant(.red), text: .constant("Kembali"), isIcon: .constant(false))
                }
                .frame(height: 75)
            }.padding()
        }
        .onAppear{
            backgroundOffset = 300
        }
        
    }
}

#Preview {
    InOutView(isIn: .constant(true), isShowInOutView: .constant(true), backgroundOffset: .constant(300))
}
