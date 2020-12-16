
#         Creating the Edit View
Navigation and Modal Presentation

In this tutorial, you’ll create a new view containing controls to edit a scrum. SwiftUI provides all the standard controls for iOS apps. You’ll add a slider, a text field, and a color picker. Then you’ll update the detail view to present your new edit view.

Download the starter project and follow along with this tutorial, or open the finished project and explore the code on your own.



30 min Estimated Time

[Project files__](https://docs-assets.developer.apple.com/published/d93ce3c63c8115840a9d6fec496b7d41/600/CreatingTheEditView.zip)

## Section 1 -  Update the Data Model

Before you create the edit view, create a new `Data` type inside `DailyScrum`. `Data` will contain all the editable properties of `DailyScrum`.

As the user edits, the view stores the scrum values in a `Data` property. If the user confirms the change, the view updates `DailyScrum` using the contents of `Data`.

<img alt="Diagram of EditView using data property" srcset="https://docs-assets.developer.apple.com/published/a6e429878e3b09ede6221b42d3e0d314/600/050_01-intro.png 1x, https://docs-assets.developer.apple.com/published/fbf727871806f25652b4f35baaadbea5/600/050_01-intro@2x.png 2x" src="https://docs-assets.developer.apple.com/published/a6e429878e3b09ede6221b42d3e0d314/600/050_01-intro.png" width="362" height="auto">


### Step 1

Define the `Data` structure inside an extension of `DailyScrum`.

Users adjust a meeting’s length with a `Slider` view. Because sliders work with `Double` values, you define `lengthInMinutes` as a `Double`.

>    Note

> By making `Data` a [nested type](https://docs.swift.org/swift-book/LanguageGuide/NestedTypes.html), you keep `DailyScrum.Data` distinct from the `Data` structure defined in the Foundation framework.




[![Swift file icon](https://developer.apple.com/tutorials/img/swift-file-icon.a03d5c08.png)DailyScrum.swift
    ](https://developer.apple.com/tutorials/app-dev-training/creating-the-edit-view#)

```swift
}
}

extension DailyScrum {
    struct Data {
        var title: String
        var attendees: [String]
        var lengthInMinutes: Double
        var color: Color
    }
}
```

    



### Step 2

Assign default values to all properties.

If all  properties have default values, the compiler creates an initializer that takes no arguments. This initializer makes it easy to create a new instance by calling `Data()`.

<aside data-v-c567d8a8="" aria-label="tip" class="tip">
    Tip

    Visit the Language Guide to learn more about [initialization](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html) in Swift.
</aside>



[![Swift file icon](https://developer.apple.com/tutorials/img/swift-file-icon.a03d5c08.png)DailyScrum.swift
    ](https://developer.apple.com/tutorials/app-dev-training/creating-the-edit-view#)

```swift
extension DailyScrum {
    struct Data {
        var title: String = ""
        var attendees: [String] = []
        var lengthInMinutes: Double = 5.0
        var color: Color = .random
    }
}
```

    



### Step 3

Add a computed `data` property that returns `Data` with the `DailyScrum` property values.

Remember to cast `lengthInMinutes` to a `Double`. All other properties have a matching type.



[![Swift file icon](https://developer.apple.com/tutorials/img/swift-file-icon.a03d5c08.png)DailyScrum.swift
    ](https://developer.apple.com/tutorials/app-dev-training/creating-the-edit-view#)

```swift
var color: Color = .random
    }

    var data: Data {
        return Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), color: color)
    }
}
```

    



![Swift file icon](https://developer.apple.com/tutorials/img/swift-file-icon.a03d5c08.png)DailyScrum.swift

```swift
import SwiftUI

struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var color: Color

    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, color: Color) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.color = color
    }
}

extension DailyScrum {
    static var data: [DailyScrum] {
        [
            DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, color: Color("Design")),
            DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, color: Color("App Dev")),
            DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 1, color: Color("Web Dev"))
        ]
    }
}

extension DailyScrum {
    struct Data {
        var title: String = ""
        var attendees: [String] = []
        var lengthInMinutes: Double = 5.0
        var color: Color = .random
    }
}
```

##       Section 2 -  Add an Edit View for Scrum Details

In this section, you’ll create the `EditView` and add controls for modifying the title, length, and color of the scrum.

You’ll store changes to the scrum in a `Data` property. You’ll define the property using the `@State` wrapper because you need to mutate the property from within the view.

SwiftUI observes `@State` properties and automatically redraws the view’s `body` when the property changes. This behavior ensures the UI stays up to date as the user manipulates the onscreen controls.

<img alt="Diagram of EditView with controls to edit title, length, and color" srcset="https://docs-assets.developer.apple.com/published/8d67ae413bd851da3abf709e4cbf1dbf/600/050_02-intro@2x.png 2x" src="https://docs-assets.developer.apple.com/published/8d67ae413bd851da3abf709e4cbf1dbf/600/050_02-intro@2x.png" width="362" height="auto">


### Step 1

Create a new SwiftUI View file named `EditView.swift`.






```swift
import SwiftUI

struct EditView: View {
    var body: some View {
        Text("Hello World")
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
```



### Step 2

Add a `@State` property for `scrumData`.

Each piece of data that you use in your view hierarchy should have a single source of truth. You can use the `@State` property wrapper to define the source of truth for value types.


>    Note
>
>    Declare `@State` properties as private so they can be accessed only within the view in which you define them.





```swift
struct EditView: View {
    @State private var scrumData: DailyScrum.Data = DailyScrum.Data()
    var body: some View {
        Text("Hello World")
```

    



### Step 3

Add a `List` and a `Section` with a “Meeting Info” header.






```swift
@State private var scrumData: DailyScrum.Data = DailyScrum.Data()
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
            }
        }
    }
}
```



### Step 4

Inside the `Section`, add a `TextField` for the meeting title.

`TextField` takes a binding to a `String`. A binding is a reference to a state that is owned by another view. You access a binding to `scrumData.title` with the expression `$scrumData.title`.




```swift
List {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrumData.title)
            }
        }
```



### Step 5

Add an `HStack` and a `Slider` for the meeting length. In the slider’s `label` closure, add a `Text` view for accessibility use.

A `Slider` stores a `Double` from a continuous range that you specify. Passing a step value of 1.0 limits the user to choosing whole numbers.


>    Note
> The `Text` view won’t appear on screen, but VoiceOver uses it to identify the purpose of the slider.




```swift
Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrumData.title)
                HStack {
                    Slider(value: $scrumData.lengthInMinutes, in: 5...30, step: 1.0) {
                        Text("Length")
                    }
                }
            }
        }
```



### Step 6

Add a `Spacer` and `Text` to display the meeting length.






```swift
Text("Length")
                    }
                    Spacer()
                    Text("\(Int(scrumData.lengthInMinutes)) minutes")
                }
            }
```



### Step 7

Add a `ColorPicker` and pass a binding to `scrumData.color`.






```swift
Text("\(Int(scrumData.lengthInMinutes)) minutes")
                }
                ColorPicker("Color", selection: $scrumData.color)
            }
        }
```



Next, you’ll add another section to `List` to display the scrum attendees.



```swift
import SwiftUI

struct EditView: View {
    @State private var scrumData: DailyScrum.Data = DailyScrum.Data()
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrumData.title)
                HStack {
                    Slider(value: $scrumData.lengthInMinutes, in: 5...30, step: 1.0) {
                        Text("Length")
                    }
                    Spacer()
                    Text("\(Int(scrumData.lengthInMinutes)) minutes")
                }
                ColorPicker("Color", selection: $scrumData.color)
            }
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
```



<img alt="Screenshot of edit view showing section header, text field, slider, and color picker button" srcset="https://docs-assets.developer.apple.com/published/67be4be30c6bff4328cc8507d2dc6f38/600/050_020-070.png 1x" src="https://docs-assets.developer.apple.com/published/67be4be30c6bff4328cc8507d2dc6f38/600/050_020-070.png" width="834" height="auto">

##         Section 3 - Display Attendees in the Edit View

In this section, you’ll display the attendees inside the `EditView`. You’ll add support for adding and deleting users.

<img alt="Diagram of EditView showing Meeting Info section and Attendees section" srcset="https://docs-assets.developer.apple.com/published/49387744978818ad19bf62933f5fb531/600/050_03-intro@2x.png 2x" src="https://docs-assets.developer.apple.com/published/49387744978818ad19bf62933f5fb531/600/050_03-intro@2x.png" width="362" height="auto">


### Step 1

Add a second `Section` with an “Attendees” header.






```swift
ColorPicker("Color", selection: $scrumData.color)
            }
            Section(header: Text("Attendees")) {
            }
        }
    }
```



### Step 2

Add a `ForEach` structure, and display each attendee in a `Text` view.

Attendees are modeled as a `String`. For simplicity, you’ll continue to use the `\.self` key path to identify attendees.




```swift
}
            Section(header: Text("Attendees")) {
                ForEach(scrumData.attendees, id: \.self) { attendee in
                    Text(attendee)
                }
            }
        }
```

    



### Step 3

Add an `onDelete` modifier to remove attendees from the scrum data.

The framework calls the closure you pass to `onDelete` when the user swipes to delete a row.




```swift
Text(attendee)
                }
                .onDelete { indices in
                    scrumData.attendees.remove(atOffsets: indices)
                }
            }
        }
```

    



### Step 4

Add a `@State` property named `newAttendee`.

The `newAttendee` property will hold the attendee name the user enters.




```swift
struct EditView: View {
    @State private var scrumData: DailyScrum.Data = DailyScrum.Data()
    @State private var newAttendee = ""
    var body: some View {
        List {
```

    



### Step 5

Add an `HStack` containing a `TextField` and pass a binding to the `newAttendee` property.

The binding keeps the `newAttendee` in sync with the contents of the `TextField`. It doesn’t affect the original `DailyScrum` model data.




```swift
scrumData.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text: $newAttendee)
                }
            }
        }
```



### Step 6

Add a `Button` with an empty action and an `Image` label.






```swift
HStack {
                    TextField("New Attendee", text: $newAttendee)
                    Button(action: {}) {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
```



### Step 7

Add an animation block that appends `newAttendee` to `scrumData.attendees`.






```swift
HStack {
                    TextField("New Attendee", text: $newAttendee)
                    Button(action: {
                        withAnimation {
                            scrumData.attendees.append(newAttendee)
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
```

    



### Step 8

Set `newAttendee` to an empty string inside the animation block.

Because the text field has a binding to `newAttendee`, setting the value to the empty string also clears the contents of the text field.




```swift
withAnimation {
                            scrumData.attendees.append(newAttendee)
                            newAttendee = ""
                        }
                    }) {
```

    



### Step 9

Disable the button if `newAttendee` is empty.

The button will activate when the user types a name in the text field.




```swift
Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newAttendee.isEmpty)
                }
            }
```



### Step 10

Set the list style to `InsetGroupedListStyle`.






```swift
}
        }
        .listStyle(InsetGroupedListStyle())
    }
}
```





```swift
import SwiftUI

struct EditView: View {
    @State private var scrumData: DailyScrum.Data = DailyScrum.Data()
    @State private var newAttendee = ""
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrumData.title)
                HStack {
                    Slider(value: $scrumData.lengthInMinutes, in: 5...30, step: 1.0) {
                        Text("Length")
                    }
                    Spacer()
                    Text("\(Int(scrumData.lengthInMinutes)) minutes")
                }
                ColorPicker("Color", selection: $scrumData.color)
            }
            Section(header: Text("Attendees")) {
                ForEach(scrumData.attendees, id: \.self) { attendee in
                    Text(attendee)
                }
                .onDelete { indices in
                    scrumData.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text: $newAttendee)
                    Button(action: {
                        withAnimation {
                            scrumData.attendees.append(newAttendee)
                            newAttendee = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newAttendee.isEmpty)
                }
            }
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
```



<img alt="Screenshot of edit view showing disabled Add button next to New Attendee text field" srcset="https://docs-assets.developer.apple.com/published/5f7afbebe40b79621a1aefc7cf3126bc/600/050_030-090.png 1x" src="https://docs-assets.developer.apple.com/published/5f7afbebe40b79621a1aefc7cf3126bc/600/050_030-090.png" width="834" height="auto">

##        Section 4 - Add Accessibility Modifiers

Now that you’ve completed the appearance and layout of the view, add accessibility modifiers to help VoiceOver users navigate the controls.

<img alt="Screenshot of EditView. The controls to which you will add accessiblity modifiers are highlighted." srcset="https://docs-assets.developer.apple.com/published/362dde20a2bdaef820dddb3c41d7641a/600/050_04-intro.png 1x, https://docs-assets.developer.apple.com/published/9333324b661935dd12e455a098bc29a7/600/050_04-intro@2x.png 2x" src="https://docs-assets.developer.apple.com/published/362dde20a2bdaef820dddb3c41d7641a/600/050_04-intro.png" width="362" height="auto">


### Step 1

Set the accessibility value for the `Slider`.






```swift
Text("Length")
                    }
                    .accessibilityValue(Text("\(Int(scrumData.lengthInMinutes)) minutes"))
                    Spacer()
                    Text("\(Int(scrumData.lengthInMinutes)) minutes")
```

    



### Step 2

Hide the text view from VoiceOver.

All the information VoiceOver needs is in the accessibility value for the slider.




```swift
Spacer()
                    Text("\(Int(scrumData.lengthInMinutes)) minutes")
                        .accessibilityHidden(true)
                }
                ColorPicker("Color", selection: $scrumData.color)
```

    



### Step 3

Add an accessibility label for the color picker.

The color picker has the “button” accessibility trait, so don’t include the word “button” in the label.




```swift
}
                ColorPicker("Color", selection: $scrumData.color)
                    .accessibilityLabel(Text("Color picker"))
            }
            Section(header: Text("Attendees")) {
```

    



### Step 4

Add an accessibility label to the image.






```swift
}) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel(Text("Add attendee"))
                    }
                    .disabled(newAttendee.isEmpty)
```

    





```swift
import SwiftUI

struct EditView: View {
    @State private var scrumData: DailyScrum.Data = DailyScrum.Data()
    @State private var newAttendee = ""
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrumData.title)
                HStack {
                    Slider(value: $scrumData.lengthInMinutes, in: 5...30, step: 1.0) {
                        Text("Length")
                    }
                    .accessibilityValue(Text("\(Int(scrumData.lengthInMinutes)) minutes"))
                    Spacer()
                    Text("\(Int(scrumData.lengthInMinutes)) minutes")
                        .accessibilityHidden(true)
                }
                ColorPicker("Color", selection: $scrumData.color)
                    .accessibilityLabel(Text("Color picker"))
            }
            Section(header: Text("Attendees")) {
                ForEach(scrumData.attendees, id: \.self) { attendee in
                    Text(attendee)
                }
                .onDelete { indices in
                    scrumData.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text: $newAttendee)
                    Button(action: {
                        withAnimation {
                            scrumData.attendees.append(newAttendee)
                            newAttendee = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel(Text("Add attendee"))
                    }
                    .disabled(newAttendee.isEmpty)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
```


##                  Section 5 - Present the Edit View

Now that you created an edit view, you need to present it to users. In this section, you’ll add a button to the `DetailView`. When a user taps the edit button, the app presents the `EditView` as a full-screen modal.




### Step 1

In `DetailView.swift`, add a `@State` property named `isPresented`.






```swift
struct DetailView: View {
    let scrum: DailyScrum
    @State private var isPresented = false
    var body: some View {
        List {
```

    



### Step 2

Add a `fullScreenCover` modifier on the `List`.

When `isPresented` changes to `true`, the app modally presents `EditView` using the entire screen.

>    Tip
>
>    You can use the `sheet` modifier to present a modal that only partially covers the underlying content. View the [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/ios/app-architecture/modality/) to learn more about using modality effectively in your apps.





```swift
.listStyle(InsetGroupedListStyle())
        .navigationTitle(scrum.title)
        .fullScreenCover(isPresented: $isPresented) {
            EditView()
        }
    }
}
```

    



### Step 3

Add a navigation button that sets `isPresented` to `true`.






```swift
}
        .listStyle(InsetGroupedListStyle())
        .navigationBarItems(trailing: Button("Edit") {
            isPresented = true
        })
        .navigationTitle(scrum.title)
        .fullScreenCover(isPresented: $isPresented) {
```



### Step 4

Embed the `EditView` in a `NavigationView`.






```swift
.navigationTitle(scrum.title)
        .fullScreenCover(isPresented: $isPresented) {
            NavigationView {
                EditView()
            }
        }
    }
```

    



### Step 5

Set the navigation title of the edit view.






```swift
NavigationView {
                EditView()
                    .navigationTitle(scrum.title)
            }
        }
```

    



### Step 6

Add navigation buttons that dismiss the `EditView` by setting `isPresented` to `false`.

These buttons have identical actions for now. You’ll update them in the next tutorial.




```swift
EditView()
                    .navigationTitle(scrum.title)
                    .navigationBarItems(leading: Button("Cancel") {
                        isPresented = false
                    }, trailing: Button("Done") {
                        isPresented = false
                    })
            }
        }
```

    



Your edit view is nearly complete, but the changes aren’t saved. In the next tutorial, you’ll add the code necessary to update the user data.



```swift
/*
 See LICENSE folder for this sample’s licensing information.
 */

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    @State private var isPresented = false
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(
                    destination: MeetingView()) {
                        Label("Start Meeting", systemImage: "timer")
                            .font(.headline)
                            .foregroundColor(.accentColor)
                            .accessibilityLabel(Text("start meeting"))
                    }
                HStack {
                    Label("Length", systemImage: "clock")
                        .accessibilityLabel(Text("meeting length"))
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                HStack {
                    Label("Color", systemImage: "paintpalette")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(scrum.color)
                }
                .accessibilityElement(children: .ignore)
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees, id: \.self) { attendee in
                    Label(attendee, systemImage: "person")
                        .accessibilityLabel(Text("person"))
                        .accessibilityValue(Text(attendee))
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationBarItems(trailing: Button("Edit") {
            isPresented = true
        })
        .navigationTitle(scrum.title)
        .fullScreenCover(isPresented: $isPresented) {
            NavigationView {
                EditView()
                    .navigationTitle(scrum.title)
                    .navigationBarItems(leading: Button("Cancel") {
                        isPresented = false
                    }, trailing: Button("Done") {
                        isPresented = false
                    })
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: DailyScrum.data[0])
        }
    }
}
```



