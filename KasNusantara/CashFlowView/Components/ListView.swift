//
//  ListView.swift
//  KasNusantara
//
//  Created by Awang Syukriansah Dirgantoro on 03/10/23.
//

import SwiftUI

struct ListView: View {
    @Binding var nominal: Int
    @Binding var keterangan: String
    @Binding var status: String
    @Binding var date: Date
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .fill(.clear)
                .stroke(.black, lineWidth: 3)
                .frame(height: 120)
                .overlay{
                    HStack{
                        VStack(alignment: .leading){
                            HStack{
                                if status == "masuk" || status == "in"{
                                    Text("[ + ]")
                                        .font(.title2)
                                        .bold()
                                } else {
                                    Text("[ - ]")
                                        .font(.title2)
                                        .bold()
                                }
                                Text(String(nominal))
                                    .font(.title)
                                    .bold()
                            }
                            Text(keterangan)
                                .font(.title2)
                            Text(status)
                                .font(.title2)
                            Text("\(date.formatted(date: .long, time: .omitted))")
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        if status == "masuk" || status == "in"{
                            Image(systemName: "arrow.up")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 70)
                                .foregroundStyle(.green)
                                .bold()
                        } else {
                            Image(systemName: "arrow.down")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 70)
                                .foregroundStyle(.red)
                                .bold()
                        }
                    }
                    .padding()
                }
        }
    }
}

#Preview {
    ListView(nominal: .constant(100000), keterangan: .constant("keterangan"), status: .constant("masuk"), date: .constant(Date.now))
}
