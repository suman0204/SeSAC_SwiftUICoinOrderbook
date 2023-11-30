//
//  HorizontalView.swift
//  SwiftUICoinOrderbook
//
//  Created by 홍수만 on 2023/11/27.
//

import SwiftUI
import WidgetKit

struct HorizontalView: View {
    
    @StateObject var viewModel = HorizontalViewModel(market: Market(market: "krw-btc", korean: "비트코인", english: "Bitcoin"))
    
    var body: some View {
        ScrollView {
            Text(viewModel.market.korean)
            GeometryReader { proxy in
                
                let grapWidth = proxy.size.width * 0.7 //차트 최대 너비
                
                VStack {
                    ForEach(viewModel.askOrderBook, id: \.id) { item in
                        HStack {
                            Text(item.price.formatted())
                                .frame(width: proxy.size.width * 0.2)
                            ZStack(alignment: .leading) {
                                
                                let graphSize = item.size / viewModel.largestAskSize() * grapWidth
                                
                                Rectangle()
                                    .foregroundStyle(Color.blue.opacity(0.4))
//                                    .frame(width: CGFloat(item.point) / 10)
                                    .frame(maxWidth: graphSize, alignment: .leading)
                                
                                Text(item.size.formatted())
                                    .frame(width: grapWidth)
                            }
                            .frame(maxWidth: .infinity)
                            .background(Color.gray)
                        }
                        .frame(height: 40)
                    }
                }
                .background(.green)
//                .onTapGesture {
//                    viewModel.timer()
//                    print(proxy)
//                    print(proxy.size)
//                }
            }
        }
        .onAppear {
            viewModel.timer()
            //UserDefaults AppGroup
            UserDefaults.groupShared.set(viewModel.market.korean, forKey: "Market")
            
            WidgetCenter.shared.reloadTimelines(ofKind: "CoinOrderBook")
//            viewModel.fetchOrderbook()
//            print("ㄱㅂ",viewModel.askOrderBook)
        }
    }
}

#Preview {
    HorizontalView()
}
