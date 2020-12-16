//
// Created by 游宗諭 in 2020/12/16
//
//
// Using Swift 5.0
//
// Running on macOS 10.15


import SwiftUI

struct CardView: View {
    let scrum : DailyScrum
    
    var body: some View {
        Text(scrum.title)
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.data[0]
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.color)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
