//
//  ListView.swift
//  SwiftUICoinOrderbook
//
//  Created by 홍수만 on 2023/11/21.
//

import SwiftUI

struct ListView: View {
    
//    @ObservedObject var viewModel = ListViewModel() // -> StateObject로 변경
    @StateObject var viewModel = ListViewModel()

    
    var body: some View {
        LazyVStack {
            Button("서버 통신") {
                viewModel.fetchAllMarket()
            }
            ForEach(viewModel.maket, id: \.self) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.korean)
                            .fontWeight(.bold)
                        Text(item.english)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                    Text(item.market)
                }
                .padding()
            }
        }
        .onAppear {
            print("ListView onAppear")
//            viewModel.fetchAllMarket()
        }
    }
}

#Preview {
    ListView()
}
