//
//  ContentView.swift
//  SwiftUICoinOrderbook
//
//  Created by 홍수만 on 2023/11/20.
//

import SwiftUI

struct ContentView: View {
    
//    @State private var banner = "23,456,467,700원"
//    @State private var money: [Market] = []
    @ObservedObject var viewModel = ContentViewModel()
    
    @State var renderingTestNumber = 0
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("테스트: \(renderingTestNumber)")
                NavigationLink("배너 테스트", value: renderingTestNumber)
                VStack {
//                    ScrollView(.horizontal) {
//                        LazyHStack {
//                            ForEach(1..<5) { data in
//                                bannerView()
                                BannerView()
//                                    .containerRelativeFrame(.horizontal)
                                    .onTapGesture {
                                        viewModel.fetchBanner()
                                    }
//                            }
//                        }
                        //스크롤 하고자 하는 대상에 대한 레이아웃 설정
//                        .scrollTargetLayout()
//                    }
//                    .scrollTargetBehavior(.viewAligned)
//                    .safeAreaPadding([.horizontal], 40)
  
                    ListView()
//                    LazyVStack {
//                        ForEach(viewModel.money, id: \.self) { data in
//                            listView(data: data)
//                        }
//                    }
                }
            }
            .scrollIndicators(.hidden)
            .refreshable { //iOS15+
                viewModel.fetchBanner()
                renderingTestNumber = Int.random(in: 1...100)
//                viewModel.banner = "34,543,234원"
//                money = money.shuffled()
            }
//            .onAppear { // 네트워크 통신을 onAppear 시점에 하는게 맞나?..
//                viewModel.fetchAllMarket()
////                UpbitAPI.fetchAllMarket { market in
////                    viewModel.money = market
////                }
////                money = dummy.shuffled()
//            }
            .navigationTitle("My Wallet")
            .navigationDestination(for: Int.self) { item in
                BannerTestView(testNumber: $renderingTestNumber)
            }
        }
    }
    
    func bannerView() -> some View {
        ZStack {
            Rectangle()
                .fill(viewModel.banner.color)
                .overlay {
                    Circle()
                        .fill(.white.opacity(0.3))
                        .offset(x: -110, y: -30)
                        .scaleEffect(1.5, anchor: .topLeading)
                }
                .clipShape(RoundedRectangle(cornerRadius: 25))
//                .padding()
                .frame(maxWidth: .infinity)
            .frame(height: 200)
            
            
            VStack(alignment:.leading) {
                Spacer()
                Text("나의 소비내역")
                    .font(.title3)
                Text(viewModel.banner.totalFormat)
                    .font(.title)
                    .bold()
            }
//            .visualEffect { content, geometryProxy in
//                content.offset(x: scrollOffset(geometryProxy))
//            }
            .padding(.vertical)
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding()
    }
    
    //GeometryProxy: 컨테이너 뷰에 대한 좌표나 크기에 접근할 수 있음!!
    func scrollOffset(_ proxy: GeometryProxy) -> CGFloat {
        let result = proxy.bounds(of: .scrollView)?.minX ?? 0
        return -result
    }
    
//    func listView(data: Market) -> some View { // -> ListView로 대체
//        HStack {
//            VStack(alignment: .leading) {
//                Text("\(data.korean)")
//                Text("\(data.english)")
//            }
//            Spacer()
//            Text(data.market)
//        }
//        .padding(.horizontal, 20)
//        .padding(.vertical, 8)
//    }
}

#Preview {
    ContentView()
}
