//
//  Provider.swift
//  SwiftUICoinOrderbook
//
//  Created by 홍수만 on 2023/11/30.
//

//import SwiftUI // 뷰를 구성하는 영역이 없어서 추가할 필요 없다
import WidgetKit

struct Provider: TimelineProvider {
    
    //실제 네트워크 통신이나 데이터를 가져오기 전에 보여줄 뷰
    //위젯킷이 최초로 렌더링할 떄 사용 -> 스켈레톤 뷰로 렌더링
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: "😀")
    }

    //위젯 미리보기 화면
    //위젯 추가하는 화면에서 쓰일 화면
    //위젯 갤러리 미리보기 화면
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: "😀")
        completion(entry)
    }

    //위젯 상태 변경 시점
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }

        //타임라인 마지막 날짜가 지난 뒤, 위젯킷이 새로운 타임라인을 요청할 수 있도록 설정
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
