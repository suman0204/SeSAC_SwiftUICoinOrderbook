//
//  BannerViewModel.swift
//  SwiftUICoinOrderbook
//
//  Created by 홍수만 on 2023/11/21.
//

import Foundation

class BannerViewModel: ObservableObject {
    @Published var banner = Banner()

    func fetchBanner() {
        banner = Banner()
    }
}
