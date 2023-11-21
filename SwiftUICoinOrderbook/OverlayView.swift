//
//  OverlayView.swift
//  SwiftUICoinOrderbook
//
//  Created by 홍수만 on 2023/11/21.
//

import SwiftUI

struct OverlayView: View {
    var body: some View {
        VStack {
            ZStack { // 각 뷰의 크기가 독립적이다
                Circle()
                    .fill(.yellow)
                    .frame(width: 150, height: 150)
                
                Text("안녕하세요, 반갑습니다 안녕히가세요")
            }
            
            Circle()
                .fill(.yellow)
                .frame(width: 150, height: 150)
                .overlay { // addSubview 같은 역할
                    Text("안녕하세요 반갑습니다 안녕히가세요")
                }

        }
    }
}

#Preview {
    OverlayView()
}
