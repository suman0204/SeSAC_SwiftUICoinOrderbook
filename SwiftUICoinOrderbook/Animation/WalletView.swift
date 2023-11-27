//
//  WalletView.swift
//  SwiftUICoinOrderbook
//
//  Created by 홍수만 on 2023/11/22.
//

import SwiftUI

struct WalletView: View {
    
    @State private var isExpandable = false //애니메이션 효과
    
    @State private var showDetail = false // 다음 화면 전환
    
    let wallet = walletList //wallet list
    @State private var currentWallet = WalletModel(name: "", index: 0) //사용자가 탭한 카드가 무엇인지 알기 위함
    
    @Namespace var animation
    
    var body: some View {
        VStack {
            topTitle()
            
            cardSpace()
            
            Button("AnimationOn") {
                withAnimation(.bouncy) { //애니메이션 효과, 딜레이 등을 추가적으로 넣을 수 있다
                    isExpandable = true
                }
            }
            Button("AnimationOff") {
                withAnimation(.bouncy) {
                    isExpandable = false
                }
            }
        }
        .overlay {
            if showDetail {
                WalletDetailView(showDetail: $showDetail, currentWallet: currentWallet, animation: animation)
            }
        }
    }
    
    func cardSpace() -> some View {
        ScrollView {
            ForEach(wallet, id: \.self) { item in
                cardView(item)
            }
        }
        .overlay {
            Rectangle()
                .fill(.black.opacity(isExpandable ? 0 : 0.01))
                .onTapGesture {
                    withAnimation {
                        isExpandable = true
                    }
                }
        }
    }
    
    func cardView(_ data: WalletModel) -> some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(data.color)
            .frame(height: 150)
            .padding(.horizontal)
            .padding(.vertical, 5)
            .offset(y: CGFloat(data.index) * (isExpandable ? 0 : -130))
            .onTapGesture {
                withAnimation {
//                    isExpandable = true
//                    
//                    if isExpandable == true {
//                        //detailView로 넘겨주기
                    //카드 탭 시 다음 화면 전환
                        showDetail = true
                    //카드 탭 시 해당 wallet에 대한 정보 넘겨주기
                    currentWallet = data
//                    }
                }
            }
            .matchedGeometryEffect(id: data, in: animation)
    }
    
    func topTitle() -> some View {
        Text("My Wallet")
            .font(.largeTitle)
            .bold()
            .frame(maxWidth: .infinity, alignment: isExpandable ? .leading : .center)
            .overlay(alignment: .trailing) {
                topOverlayButton()
            }
            .padding()
    }
    
    func topOverlayButton() -> some View {
        Button{
            withAnimation {
                isExpandable = false
            }
        } label: {
            Image(systemName: "plus")
                .foregroundStyle(.white)
                .padding()
                .background(.black, in: Circle())
        }
        .rotationEffect(.degrees(isExpandable ? 225 : 45))
        .opacity(isExpandable ? 1 : 0)
    }
}

#Preview {
    WalletView()
}
