
#         Creating a Navigation Hierarchy
Navigation and Modal Presentation

You’ve learned how to create SwiftUI views, but how do you navigate between them? In this tutorial, you’ll create a navigation hierarchy.

You’ll start with the list screen, then present the detail view. Finally, you’ll push the timer view to the top of the navigation stack.

Download the starter project and follow along with this tutorial, or open the finished project and explore the code on your own.



20 min Estimated Time


[Project files__](https://docs-assets.developer.apple.com/published/3e7b3a812f60ff2446f571c7c3fdbf7d/600/CreatingANavigationHierarchy.zip)



[        Xcode 12__](https://apps.apple.com/us/app/xcode/id497799835?mt=12)

[          Section 1
        ](https://developer.apple.com/tutorials/app-dev-training/creating-a-navigation-hierarchy#Set-Up-Navigation)

##         Set Up Navigation

From the `NavigationView` container view, you can traverse a stack of views in a hierarchy. You’ll set up the navigation by wrapping your root view in the main app file, `ScrumdingerApp.swift`.

<img alt="Wireframe of ScrumsView screen highlighting navigation bar and disclosure indicator in ScrumsView list screen" srcset="https://docs-assets.developer.apple.com/published/e4b8add8fd61a21861632c64fc312d0f/600/040-010-intro.png 1x, https://docs-assets.developer.apple.com/published/d664d9ab349540d5eb1ef1347522d2fd/600/040-010-intro@2x.png 2x" src="https://docs-assets.developer.apple.com/published/e4b8add8fd61a21861632c64fc312d0f/600/040-010-intro.png" width="362" height="auto">



### Step 1

In `ScrumdingerApp.swift,` embed `ScrumsView` in a `NavigationView`.





[![Swift file icon](https://developer.apple.com/tutorials/img/swift-file-icon.a03d5c08.png)ScrumdingerApp.swift
    ](https://developer.apple.com/tutorials/app-dev-training/creating-a-navigation-hierarchy#)

```swift
var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: DailyScrum.data)
            }
        }
    }
```

    No preview



### Step 2

In `ScrumsView.swift,` embed the `ScrumsView` preview in a `NavigationView`.

Adding the `NavigationView` displays navigation elements, like title and bar buttons, on the canvas. For now, the preview displays padding for a navigation title.




```swift
struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: DailyScrum.data)
        }
    }
}
```



### Step 3

Add a `NavigationLink`, passing `Text(scrum.title)` as the destination in the initializer.

The destination presents a single view in the navigation hierarchy when a user interacts with the element. Each row pushes to an individual destination. The `Text` view acts as a placeholder until you create the detail screen in the next section.


>    Note
>
>    SwiftUI automatically adds a disclosure indicator to the row.





```swift
List {
            ForEach(scrums) { scrum in
                NavigationLink(destination: Text(scrum.title)) {
                    CardView(scrum: scrum)
                        .listRowBackground(scrum.color)
                }
            }
        }
```



### Step 4

Move the `.listRowBackground` modifier to `NavigationLink`.






```swift
CardView(scrum: scrum)
                }
                .listRowBackground(scrum.color)
            }
        }
```



### Step 5

Add a `navigationTitle` to display `Daily Scrums`.

Notice that you add the `.navigationTitle` modifier to the `List`. The child view can affect the appearance of the `NavigationView` using modifiers.




```swift
}
        }
        .navigationTitle("Daily Scrums")
    }
}
```



### Step 6

Add a trailing navigation bar item that displays the `plus` icon.

Pass an empty action for now, but you’ll revisit this view in a later tutorial when you create a screen for adding new scrums.




```swift
}
        .navigationTitle("Daily Scrums")
        .navigationBarItems(trailing: Button(action: {}) {
            Image(systemName: "plus")
        })
    }
}
```



### Step 7

Run your app in the live preview and verify that you can navigate from a row to the `scrum.title` view.

In addition to the disclosure indicator, SwiftUI automatically adds the back button in the detail view and fills in the title of the previous screen.




## Section 2 -  Create the Detail View

In hierarchical apps, you navigate from a high-level view to a detailed view so that you can manipulate specific data elements. In this section, you’ll create the scrum detail view.

<img alt="Flowchart of navigation hierarchy highlighting DetailView wireframe" srcset="https://docs-assets.developer.apple.com/published/50047213ca5b08a3d5db4ed7b90f916f/600/040-020-intro.png 1x, https://docs-assets.developer.apple.com/published/18ecf1195ce5b8e2ffc6d9c4f7813738/600/040-020-intro@2x.png 2x" src="https://docs-assets.developer.apple.com/published/50047213ca5b08a3d5db4ed7b90f916f/600/040-020-intro.png" width="362" height="auto">



### Step 1

Create a new SwiftUI View file named `DetailView.swift`.







```swift
import SwiftUI

struct DetailView: View {
```



### Step 2

Add a `scrum` constant.







```swift
struct DetailView: View {
    let scrum: DailyScrum

    var body: some View {
        Text("Hello, World!")
```

    No preview




>    Note
>
>    The compiler throws an error because the `DetailView` call in the preview provider is missing the `scrum` parameter.


### Step 3

In the preview provider, initialize `DetailView` with the scrum data.







```swift
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(scrum: DailyScrum.data[0])
    }
}
```




>    Note
>
>    The compiler error is resolved with the update to the call.

### Step 4

Wrap `DetailView` in a `NavigationView` to preview navigation elements on the canvas.







```swift
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: DailyScrum.data[0])
        }
    }
}
```





```swift
import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum

    var body: some View {
        Text("Hello, World!")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(scrum: DailyScrum.data[0])
    }
}
```



<img alt="Screenshot of canvas with Hello, World in middle of screen" srcset="https://docs-assets.developer.apple.com/published/1cf9e4d5848271d1e48826f4a5c831dc/600/040-020-030-preview.png 1x" src="https://docs-assets.developer.apple.com/published/1cf9e4d5848271d1e48826f4a5c831dc/600/040-020-030-preview.png" width="834" height="auto">

## Section 3 -  Add Visual Components to the Detail View

Now that you have a skeleton of the detail view, you’ll add the visual components to complete it. The completed detail view displays the name of a scrum, meeting duration, card color, and attendee list.

<img alt="Wireframe of DetailView screen highlighting list view" srcset="https://docs-assets.developer.apple.com/published/13530c6a859f64df8636b093d0040c5b/600/040-030-intro.png 1x, https://docs-assets.developer.apple.com/published/7ec8f732d01f0e19acaf98c1f4aa73b3/600/040-030-intro@2x.png 2x" src="https://docs-assets.developer.apple.com/published/13530c6a859f64df8636b093d0040c5b/600/040-030-intro.png" width="362" height="auto">



### Step 1

In `ScrumsView.swift`, update the `NavigationLink` to set `DetailView` as the new destination.






```swift
List {
            ForEach(scrums) { scrum in
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                }
```

    No preview



### Step 2

In `DetailView.swift`, replace the `Text` view with a `List` to display meeting details.

You’ll use the list to display static subviews in a single column with rows. In the next section of this tutorial, you’ll dynamically build list rows.





```swift
var body: some View {
        List {
        }
    }
}
```



### Step 3

Add a `Section` with the header `Meeting Info`.

Sections create visual distinctions within your list. They help you to chunk content and establish groups in the information hierarchy of the list view.





```swift
var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
            }
        }
    }
```



### Step 4

Add a `Label` for starting a meeting and include an accessibility label to describe the element.

This row will act as a trigger to navigate to the meeting view.





```swift
List {
            Section(header: Text("Meeting Info")) {
                Label("Start Meeting", systemImage: "timer")
                    .accessibilityLabel(Text("Start meeting"))
            }
        }
```



### Step 5

Alter the appearance of the label by adding `foregroundColor` and `font` modifiers.

Because this row is an interactive element, adding the accent color matches it with other interactive elements.





```swift
Section(header: Text("Meeting Info")) {
                Label("Start Meeting", systemImage: "timer")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                    .accessibilityLabel(Text("Start meeting"))
            }
```



### Step 6

Create an `HStack`, add a `Label` with the `clock` icon for the meeting length, then add an accessibility label.







```swift
.foregroundColor(.accentColor)
                    .accessibilityLabel(Text("Start meeting"))
                HStack {
                    Label("Length", systemImage: "clock")
                        .accessibilityLabel(Text("Meeting length"))
                }
            }
        }
```



### Step 7

Add a `Spacer` and display the value of the meeting length in a `Text` view.







```swift
Label("Length", systemImage: "clock")
                        .accessibilityLabel(Text("Meeting length"))
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
            }
```



### Step 8

Create an `HStack`, then add a `Label` with the `paintpalette` icon for the scrum card color.







```swift
Text("\(scrum.lengthInMinutes) minutes")
                }
                HStack {
                    Label("Color", systemImage: "paintpalette")
                }
            }
        }
```



### Step 9

Add a `Spacer()`, and display the `checkmark.circle.fill` icon in an `Image`.







```swift
HStack {
                    Label("Color", systemImage: "paintpalette")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                }
            }
```



### Step 10

Modify the foreground color of the `Image` to use the scrum color and ignore accessibility elements on the `HStack`.

You’re ignoring accessibility elements because color information isn’t relevant for VoiceOver.





```swift
Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(scrum.color)
                }
                .accessibilityElement(children: .ignore)
```



### Step 11

Modify `List` with `.listStyle(InsetGroupedListStyle())`.

This modifier adds rounded corners and insets the list from the edges of the parent view.





```swift
}
        }
        .listStyle(InsetGroupedListStyle())
    }
}
```





```swift
import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum

    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                Label("Start Meeting", systemImage: "timer")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                    .accessibilityLabel(Text("Start meeting"))
                HStack {
                    Label("Length", systemImage: "clock")
                        .accessibilityLabel(Text("Meeting length"))
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



<img alt="Screenshot of canvas with meeting color value adding color to circle icon" srcset="https://docs-assets.developer.apple.com/published/add28136f4a921043f9dcfdee29b6e7e/600/040-030-100-preview.png 1x" src="https://docs-assets.developer.apple.com/published/add28136f4a921043f9dcfdee29b6e7e/600/040-030-100-preview.png" width="834" height="auto">

## Section 4 -  Iterate Through Attendees

The last section you’ll add to the detail screen is the attendees list. In the previous tutorial, you learned about `ForEach` and key paths. In this section, you’ll use `ForEach` to iterate through a list of attendees in the sample data.

<img alt="Wireframe of DetailView screen with lines connecting ForEach code snippet to attendees list" srcset="https://docs-assets.developer.apple.com/published/3c7fd937fa4acfd510025f361e353546/600/040-040-intro.png 1x, https://docs-assets.developer.apple.com/published/d15a3b8c84ce51384957d79f3f53596f/600/040-040-intro@2x.png 2x" src="https://docs-assets.developer.apple.com/published/3c7fd937fa4acfd510025f361e353546/600/040-040-intro.png" width="362" height="auto">



### Step 1

Create a `Section` with the header `Attendees` to group the attendee information.







```swift
.accessibilityElement(children: .ignore)
            }
            Section(header: Text("Attendees")) {
            }
        }
        .listStyle(InsetGroupedListStyle())
```



### Step 2

Add a `ForEach` to dynamically generate the list of attendees. Pass `scrum.attendees` as the data and the key path `\.self` as the `id`.







```swift
}
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees, id: \.self) { attendee in
                }
            }
        }
```

    No preview



### Step 3

Add a `Label` to display an attendee.







```swift
Section(header: Text("Attendees")) {
                ForEach(scrum.attendees, id: \.self) { attendee in
                    Label(attendee, systemImage: "person")
                }
            }
```



### Step 4

Add an accessibility label and value for attendees.







```swift
ForEach(scrum.attendees, id: \.self) { attendee in
                    Label(attendee, systemImage: "person")
                        .accessibilityLabel(Text("Person"))
                        .accessibilityValue(Text(attendee))
                }
            }
```

    No preview





```swift
import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum

    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                Label("Start Meeting", systemImage: "timer")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                    .accessibilityLabel(Text("Start meeting"))
                HStack {
                    Label("Length", systemImage: "clock")
                        .accessibilityLabel(Text("Meeting length"))
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
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
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

<button data-v-b4b513b2="" class="header" disabled="disabled" title="No preview available for this step."><span data-v-b4b513b2="" class="runtime-preview-label">No Preview</span><span data-v-b4b513b2="" aria-label="Show" class="preview-show">↙</span></button>

[          Section 5
        ](https://developer.apple.com/tutorials/app-dev-training/creating-a-navigation-hierarchy#Navigate-Between-Screens)

##         Navigate Between Screens

Now that your detail screen is complete, you’ll create a navigation hierarchy to transition between screens.

<img alt="Flowchart of navigation hierarchy highlighting arrows between ScrumsView, DetailView, and MeetingView wireframes" srcset="https://docs-assets.developer.apple.com/published/476071d459e547dfb9e8f873100188ca/600/040-050-intro.png 1x, https://docs-assets.developer.apple.com/published/fd08cea6b921e97b30c03983fbc7e596/600/040-050-intro@2x.png 2x" src="https://docs-assets.developer.apple.com/published/476071d459e547dfb9e8f873100188ca/600/040-050-intro.png" width="362" height="auto">



Recall that in `ScrumsView.swift`, you set the destination in the `NavigationLink` to `DetailView`. Now you’ll finish setting the navigation hierarchy from `DetailView`.

### Step 1

Wrap the Start Meeting `Label` with a `NavigationLink` that sets `MeetingView` as the destination.

Adding `NavigationLink` wraps the label in a gesture recognizer so that users can tap this row to transition to the meeting timer screen.





```swift
List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView()) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
```



### Step 2

Display the scrum title by setting `.navigationTitle(scrum.title)` on the `List`.







```swift
}
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(scrum.title)
    }
}
```



### Step 3

Run your app in Simulator to verify that you can navigate between the list, detail, and timer screens.

SwiftUI automatically includes the animations when pushing and popping from the navigation stack.

<video data-v-f6e12e74="" autoplay="autoplay" muted="muted" playsinline="">
    

    <source src="https://docs-assets.developer.apple.com/published/73e1bcf298a125ba3806a265cf557f43/600/040-050-030@2x.mp4">
</video>Replay



Now that you’ve created a navigation hierarchy to transition between screens, how do you move data between screens? In the next tutorials, you’ll learn about editing, updating, and passing data throughout your navigation stack.



```swift
import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum

    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView()) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                        .accessibilityLabel(Text("Start meeting"))
                }
                HStack {
                    Label("Length", systemImage: "clock")
                        .accessibilityLabel(Text("Meeting length"))
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
                        .accessibilityLabel(Text("Person"))
                        .accessibilityValue(Text(attendee))
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
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



<img alt="Screenshot of canvas with disclosure indicator at end of Start Meeting row" srcset="https://docs-assets.developer.apple.com/published/9a8242d835376ad3df2fde4227cc064e/600/040-050-010-preview.png 1x" src="https://docs-assets.developer.apple.com/published/9a8242d835376ad3df2fde4227cc064e/600/040-050-010-preview.png" width="834" height="auto">


