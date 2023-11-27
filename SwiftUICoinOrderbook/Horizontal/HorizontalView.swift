//
//  HorizontalView.swift
//  SwiftUICoinOrderbook
//
//  Created by 홍수만 on 2023/11/27.
//

import SwiftUI

struct HorizontalView: View {
    
    @StateObject var viewModel = HorizontalViewModel()
    
    var body: some View {
        ScrollView {
            Text("\(viewModel.value)")
            GeometryReader { proxy in
                
                let grapWidth = proxy.size.width
                
                VStack {
                    ForEach(horizontalDummy, id: \.id) { item in
                        HStack {
                            Text(item.data)
                                .frame(width: proxy.size.width * 0.2)
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .foregroundStyle(Color.blue.opacity(0.4))
                                    .frame(width: CGFloat(item.point) / 10)
                                    .frame(maxWidth: grapWidth * 0.7)
                                Text(item.point.formatted())
                            }
                            .frame(maxWidth: .infinity)
                            .background(Color.gray)
                        }
                        .frame(height: 40)
                    }
                }
                .background(.green)
                .onTapGesture {
                    viewModel.timer()
                    print(proxy)
                    print(proxy.size)
            }
            }
        }
    }
}

#Preview {
    HorizontalView()
}
