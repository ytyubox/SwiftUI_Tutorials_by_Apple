//
// Created by 游宗諭 in 2020/12/15
//
//
// Using Swift 5.0
//
// Running on macOS 10.15

import SwiftUI

@main
struct SwiftUI_Tutorials_by_AppleApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.data)
        }
    }
}
