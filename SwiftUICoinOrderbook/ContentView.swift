//
//  ContentView.swift
//  SwiftUICoinOrderbook
//
//  Created by 홍수만 on 2023/11/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var banner = "23,456,789,467,700원"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    bannerView()
                    LazyVStack {
                        ForEach(1..<50) { data in
                            listView(data: data)
                        }
                    }
                }
            }
            .refreshable { //iOS15+
                banner = "34,543,234원"
            }
            .navigationTitle("My Wallet")
        }
    }
    
    func bannerView() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.gray)
//                .padding()
                .frame(maxWidth: .infinity)
            .frame(height: 200)
            
            VStack(alignment:.leading) {
                Spacer()
                Text("나의 소비내역")
                Text(banner)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding()
    }
    
    func listView(data: Int) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("비트코인 \(data)")
                Text("Bitcoin \(data)")
            }
            Spacer()
            Text("KRW-BTC")
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
    }
}

#Preview {
    ContentView()
}
