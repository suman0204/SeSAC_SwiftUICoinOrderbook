//
//  EntryView.swift
//  CoinOrderBookExtension
//
//  Created by 홍수만 on 2023/11/30.
//

import WidgetKit
import SwiftUI

struct CoinOrderBookEntryView : View { //Widget UI - 위젯을 구성하는 View
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text(entry.test)
            Text(entry.date, style: .time)

            Text(UserDefaults.groupShared.string(forKey: "Market") ?? "잭코인")
//            Text(entry.token)
            Text(entry.price.formatted())
        }
    }
}
