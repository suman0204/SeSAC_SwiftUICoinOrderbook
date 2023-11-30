//
//  CoinOrderBook.swift
//  CoinOrderBook
//
//  Created by 홍수만 on 2023/11/29.
//

import WidgetKit
import SwiftUI

struct CoinOrderBook: Widget {
    let kind: String = "CoinOrderBook" //위젯을 구분할 수 있는 고유한 문자열

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                CoinOrderBookEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                CoinOrderBookEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("보유 코인")
        .description("실시간 시세를 확인하세요")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

//#Preview(as: .systemSmall) {
//    CoinOrderBook()
//} timeline: {
//    SimpleEntry(date: .now, emoji: "😀")
//    SimpleEntry(date: .now, emoji: "🤩")
//}
