//
//  OrderBookModel.swift
//  SwiftUICoinOrderbook
//
//  Created by 홍수만 on 2023/11/28.
//

import Foundation

struct OrderBookModel: Decodable { //Server에서 오는 값
    let market: String
    let timestamp: Int
    let total_ask_size, total_bid_size: Double
    let orderbook_units: [OrderBookUnit]
}

struct OrderBookUnit: Decodable { //Server에서 오는 값
    let ask_price, bid_price: Double
    let ask_size, bid_size: Double
}

struct OrderBookItem: Hashable, Identifiable { //View에서 사용할 값
    let id = UUID()
    let price: Double
    let size: Double
}
