//
//  ListViewModel.swift
//  SwiftUICoinOrderbook
//
//  Created by 홍수만 on 2023/11/21.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var maket : [Market] = [Market(market: "a", korean: "b", english: "c"),
                                       Market(market: "a", korean: "t", english: "c"),
                                       Market(market: "a", korean: "b", english: "d")]
    
    func fetchAllMarket()  {
        
        let url = URL(string: "https://api.upbit.com/v1/market/all")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("데이터 응답 없음")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([Market].self, from: data)
                print(decodedData)
                
                self.maket = decodedData
                
            } catch {
                print(error)
            }
            
        }
        .resume() //resume 필수!
    }
}
