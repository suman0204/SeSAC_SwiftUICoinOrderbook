//
//  HorizontalData.swift
//  SwiftUICoinOrderbook
//
//  Created by 홍수만 on 2023/11/27.
//

import Foundation

struct HorizontalData: Identifiable {
    let id = UUID()
    let data: String
    let point = Int.random(in: 10...5000)
}
