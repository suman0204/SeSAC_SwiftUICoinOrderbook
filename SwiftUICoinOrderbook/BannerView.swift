//
//  BannerView.swift
//  SwiftUICoinOrderbook
//
//  Created by 홍수만 on 2023/11/21.
//

import SwiftUI

struct BannerView: View {
    
    @ObservedObject var viewModel = BannerViewModel()
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(1..<5) { item in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(.gray)
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
            //            .frame(height: 200)
                        
                        
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
                        .padding()
            //            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .frame(width: .infinity, height: 200)
                    .padding()
                    .containerRelativeFrame(.horizontal)
                }
            }
            .scrollTargetLayout()

        }
        .scrollTargetBehavior(.viewAligned)

    }
}

#Preview {
    BannerView()
}
