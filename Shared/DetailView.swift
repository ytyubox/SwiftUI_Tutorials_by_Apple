//
// Created by 游宗諭 in 2020/12/16
//
//
// Using Swift 5.0
//
// Running on macOS 10.15

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: DailyScrum.data[0])
        }
    }
}
