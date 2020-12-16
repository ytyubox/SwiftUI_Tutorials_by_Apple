# Displaying Data in a List

`List` is a container view that displays rows of data arranged in a single, scrollable column. In this tutorial, you’ll use a `List` view to display a summary of each of the user’s daily scrums. Then you’ll make the list the main screen of the app.

Download the starter project and follow along with this tutorial, or open the finished project and explore on your own.



15 min Estimated Time

[Project files__](https://docs-assets.developer.apple.com/published/f30a66e5371df1462cb8925d448fcce0/600/DisplayingDataInAList.zip)

##       Section 1 -  Display a List of Daily Scrums

You can populate a `List` with static or dynamic views. In this section, you’ll use a SwiftUI `ForEach` view structure to dynamically generate rows from an array of `DailyScrum` objects. You’ll use the `CardView` that you built in the previous tutorial to construct each row.

<img alt=" " srcset="https://docs-assets.developer.apple.com/published/6c7e13eb16809b363b854dc5767dc942/600/030-001.png 1x, https://docs-assets.developer.apple.com/published/afaf5a8df092714c9d70ef22438caa97/600/030-001@2x.png 2x" src="https://docs-assets.developer.apple.com/published/6c7e13eb16809b363b854dc5767dc942/600/030-001.png" width="362" height="auto"></picture>



### Step 1

Create a new SwiftUI View file named `ScrumsView.swift`.




```swift
import SwiftUI

struct ScrumsView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView()
    }
}
```





### Step 2

Add a constant property named `scrums` of type `[DailyScrum]`.



```swift
struct ScrumsView: View {
    let scrums: [DailyScrum]

    var body: some View {
```





>    Note
>
>    Adding the `scrums` property causes a compiler error because `ScrumsView` now needs to be initialized with an array of scrums. You’ll fix this issue in the next step.


### Step 3

In `ScrumsView_Previews`, pass an array of scrums to the `ScrumsView` initializer.




```swift
struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.data)
    }
}
```





### Step 4

Replace the default `Text` view with a `List` view.

The `List` initializer in this step accepts a `ViewBuilder` as its only parameter. So, you can add rows with the same syntax you’ve been using with other container views such as `HStack` and `VStack`.

>    Tip
>
>    You can also initialize lists from collections of data, specify a different selection type, and more. To learn about the `List` view, read the [Apple Developer Documentation](https://developer.apple.com/documentation/swiftui/list).




```swift
var body: some View {
        List {

        }
    }
}
```





Next, you’ll populate the `List` using a `ForEach` view. To create views using `ForEach`, you’ll pass its initializer a collection of items along with a closure that creates a view for each item.

### Step 5

Add a `ForEach` view. Pass the `scrums` array and a key path to the `title` property to the initializer.

`ForEach` needs a way to identify individual items in the collection. For now, because all of the scrums in the test data have different names, you can use the `title` property to identify each item.


>     Note
> 
>     In the next section, you’ll learn how to provide a stable notion of identity to `DailyScrum`.




```swift
var body: some View {
        List {
            ForEach(scrums, id: \.title) { scrum in

            }
        }
    }
```





### Step 6

Initialize a `CardView` in the `ForEach` closure.

This closure returns a `CardView` for each element in the `scrums` array.



```swift
List {
            ForEach(scrums, id: \.title) { scrum in
                CardView(scrum: scrum)
            }
        }
```


Recall that the color of text in a `CardView` is either black or white, depending on the scrum’s color. Only one item appears in the list because the color of the second and third  scrums produce white text, and until you specify a different color, the background of `CardView` is white as well.

### Step 7

Set the background color of the row to `scrum.color`.

```swift
ForEach(scrums, id: \.title) { scrum in
                CardView(scrum: scrum)
                    .listRowBackground(scrum.color)
            }
        }
```


```swift
import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]

    var body: some View {
        List {
            ForEach(scrums, id: \.title) { scrum in
                CardView(scrum: scrum)
                    .listRowBackground(scrum.color)
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.data)
    }
}
```

<img alt="Screenshot of List view showing details of three daily scrums. Each row has a different background color, and the text color is either black or white, depending on the background." srcset="https://docs-assets.developer.apple.com/published/91fab8a46070f61e43930b1654284d02/600/030-001-007.png 1x" src="https://docs-assets.developer.apple.com/published/91fab8a46070f61e43930b1654284d02/600/030-001-007.png" width="834" height="auto"></picture>

##       Section 2 -  Make Scrums Identifiable

`ForEach` structures generate dynamic views by iterating over identifiable data. In the previous section, you used a key path to identify scrums by their titles. This approach worked for prototyping because each scrum in the sample data has a unique title. But users would experience issues if they tried to create a new scrum with the same title as an existing one.

To work with user-generated content, you’ll make `DailyScrum` conform to the `Identifiable` protocol for a more robust way to communicate identity. The protocol has one requirement — an `id` property that provides a stable identifier for the entity.

<img alt=" " srcset="https://docs-assets.developer.apple.com/published/bcd7aa41b8a73cb649c6b156ba5d448b/600/030-002.png 1x, https://docs-assets.developer.apple.com/published/d0b4b0653185afead6f2646545c71aa1/600/030-002@2x.png 2x" src="https://docs-assets.developer.apple.com/published/bcd7aa41b8a73cb649c6b156ba5d448b/600/030-002.png" width="362" height="auto"></picture>



### Step 1

Open `DailyScrum.swift` and declare conformance to the `Identifiable` protocol.





```swift
import SwiftUI

struct DailyScrum: Identifiable {
    var title: String
    var attendees: [String]
```





>    Note
>
>    To conform to `Identifiable`, a model must have a property named `id`. Your code won’t compile until you add this property.


### Step 2

Add a constant named `id` of type `UUID`.





```swift
struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [String]
```






>    Note
>
>    Your code still won’t compile because the `DailyScrum` initializers in the `data` array don’t include an `id` argument.


### Step 3

Add an initializer that assigns a default value to the `id` property.

>    Tip
>
>    When you define a default value for a parameter, you can omit that parameter when you call an initializer or function.




```swift
var color: Color

    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, color: Color) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.color = color
    }
}
```






>    Note
>
>    Your code will compile after you add this initializer.


Now that `DailyScrum` conforms to the `Identifiable` protocol, you’ll simplify the `ForEach` initializer.

### Step 4

In `ScrumsView.swift`, remove the `id` parameter from the `ForEach` initializer.





[![Swift file icon](https://developer.apple.com/tutorials/img/swift-file-icon.a03d5c08.png)ScrumsView.swift
    ](https://developer.apple.com/tutorials/app-dev-training/displaying-data-in-a-list#)

```swift
var body: some View {
        List {
            ForEach(scrums) { scrum in
                CardView(scrum: scrum)
                    .listRowBackground(scrum.color)
```


Now you’ll make `ScrumsView` the app’s root view. You create a SwiftUI app by declaring a structure that conforms to the `App` protocol. The app’s `body` property returns a `Scene` that contains a view hierarchy representing the primary user interface for the app.

### Step 5

Open `ScrumdingerApp.swift` and set `ScrumsView` as the initial view for the app.

`WindowGroup` is one of the primitive scenes that SwiftUI provides. On iOS, the views you add to the `WindowGroup` scene builder are presented in a window that fills the device’s entire screen.





```swift
var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.data)
        }
    }
```





### Step 6

Build and run the app in Simulator to verify that `ScrumsList` appears when the app launches.



<img alt="Screenshot of Scrumdinger running in Simulator" srcset="https://docs-assets.developer.apple.com/published/67cf5307575bbabbf49afbda8d8131ba/600/030-002-006-simulator.png 1x, https://docs-assets.developer.apple.com/published/6f952ac340cdd9d49150ecf278c7ef73/600/030-002-006-simulator@2x.png 2x" src="https://docs-assets.developer.apple.com/published/67cf5307575bbabbf49afbda8d8131ba/600/030-002-006-simulator.png" width="531" height="auto">



You’ve accomplished quite a bit so far. You designed two of Scrumdinger’s main screens — `MeetingView` and `ScrumsList` — and set the app’s root view. In the next chapter, you’ll make the app more interactive by giving users the ability to navigate between views.

<img alt="Screenshot of Scrumdinger running in Simulator" srcset="https://docs-assets.developer.apple.com/published/67cf5307575bbabbf49afbda8d8131ba/600/030-002-006-simulator.png 1x, https://docs-assets.developer.apple.com/published/6f952ac340cdd9d49150ecf278c7ef73/600/030-002-006-simulator@2x.png 2x" src="https://docs-assets.developer.apple.com/published/67cf5307575bbabbf49afbda8d8131ba/600/030-002-006-simulator.png" width="531" height="auto">

## Check Your Understanding
