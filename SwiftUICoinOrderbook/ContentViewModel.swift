//
//  ContentViewModel.swift
//  SwiftUICoinOrderbook
//
//  Created by 홍수만 on 2023/11/21.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    // @State 대신 @Published 사용
    @Published var banner = Banner()
//    @Published var money: [Market] = [] // -> ListViewModel로 이동
    
    func fetchBanner() {
        banner = Banner()
    }
    
//    func fetchAllMarket()  { // -> ListViewModel로 이동
//        
//        let url = URL(string: "https://api.upbit.com/v1/market/all")!
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data else {
//                print("데이터 응답 없음")
//                return
//            }
//            
//            do {
//                let decodedData = try JSONDecoder().decode([Market].self, from: data)
//                print(decodedData)
//                
//                self.money = decodedData
//                
//            } catch {
//                print(error)
//            }
//            
//        }
//        .resume() //resume 필수!
//    }
    
}
