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
        VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/) {
            Text(scrum.title)
                .font(.headline)
            Spacer()
            HStack {
                Label(scrum.attendees.count.description, systemImage: "person.3")
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Attendees"))
                    .accessibilityValue(Text(scrum.attendees.count.description))
                Spacer()
                Label(scrum.lengthInMinutes.description, systemImage: "clock")
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Meeting length"))
                    .accessibilityValue(Text("\(scrum.lengthInMinutes) minutes"))
                    .padding(.trailing, 20)
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(scrum.color.accessibleFontColor)
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
