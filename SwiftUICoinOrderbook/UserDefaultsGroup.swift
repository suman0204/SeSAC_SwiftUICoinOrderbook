//
//  UserDefaultsGroup.swift
//  SwiftUICoinOrderbook
//
//  Created by 홍수만 on 2023/11/30.
//

import Foundation

extension UserDefaults {
    
    static var groupShared: UserDefaults {
        let appGroupID = "group.SoomanHong.SwiftUICoinOrderbook.MyWallet"
        return UserDefaults(suiteName: appGroupID)!
    }
}
