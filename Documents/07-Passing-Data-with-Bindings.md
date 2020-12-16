
#         Passing Data with Bindings
Passing Data

In the previous tutorial, you used bindings to share state between the edit view and individual UI controls within the view. In this tutorial, you’ll build out the editing functions of Scrumdinger using bindings to share state between different screens in the app.

You’ll start by adding a binding to `EditView`, then work your way up through the view hierarchy, adding bindings to allow child views to mutate state stored in parent views.

Download the starter project and follow along with this tutorial, or open the finished project and explore the code on your own.



20 min Estimated Time

[Project files__](https://docs-assets.developer.apple.com/published/513c3ff2fb156bb5ba7d6db074403699/600/PassingDataWithBindings.zip)
## Section 1 - Pass the Edit View a Binding to Scrum Data

In this section, you’ll add bindings so that `EditView` can mutate data passed in from `DetailView`.

You’ll update `EditView` to work with a binding to a `DailyScrum.Data` value and modify `DetailView` to provide that binding when initializing `EditView`. You’ll also add code to update the scrum in the detail view when the user taps the Done button.

<img alt="" srcset="https://docs-assets.developer.apple.com/published/6cd91d6c2d8f5a6f136200d1fc06cd4a/600/060-001.png 1x, https://docs-assets.developer.apple.com/published/821fcb1bf3ef707dcba06d99e8e29c05/600/060-001@2x.png 2x" src="https://docs-assets.developer.apple.com/published/6cd91d6c2d8f5a6f136200d1fc06cd4a/600/060-001.png" width="362" height="auto">



You should maintain a single source of truth for every piece of data in your app and use bindings to share a reference to that source of truth. The edit screen should act on data that the detail screen owns, instead of creating a new source of truth.

### Step 1

In `EditView.swift`, convert the `scrumData` `@State` property to a `@Binding`.

Because  `scrumData` is now passed in during initialization, you need to remove the `private` attribute and `DailyScrum.Data` initialization.





```swift
struct EditView: View {
    @Binding var scrumData: DailyScrum.Data
    @State private var newAttendee = ""
    var body: some View {
```

    



>Note

>    Updating `scrumData` creates compiler errors because `EditView` now requires a binding. You’ll see similar errors throughout this tutorial as you update other views.


### Step 2

Pass a constant binding to the `EditView` initializer in `EditView_Previews`.

You can use the `constant(_:)` type method to create a binding to a hard-coded, immutable value. Constant bindings are useful in previews or when you’re prototyping your app’s UI.





```swift
struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(scrumData: .constant(DailyScrum.data[0].data))
    }
}
```

    



Next, you’ll create a source of truth for the binding you added to `EditView`.

### Step 3

In `DetailView.swift`, add a private `@State` property named `data`.







```swift
struct DetailView: View {
    let scrum: DailyScrum
    @State private var data: DailyScrum.Data = DailyScrum.Data()
    @State private var isPresented = false
    var body: some View {
```

    



The empty initializer creates an instance with default values for its properties. You’ll update these values to match the selected scrum when the user taps the Edit button.

### Step 4

Set `data` to `scrum.data` in the Edit button’s `action` closure.







```swift
.navigationBarItems(trailing: Button("Edit") {
            isPresented = true
            data = scrum.data
        })
        .navigationTitle(scrum.title)
```

    



### Step 5

Update the `EditView` initializer to include a binding to `data`.

Modifications a user makes to `scrumData` in the edit view are now shared with the `data` property in the detail view.





```swift
.fullScreenCover(isPresented: $isPresented) {
            NavigationView {
                EditView(scrumData: $data)
                    .navigationTitle(scrum.title)
                    .navigationBarItems(leading: Button("Cancel") {
```

    



Next, add code to update `scrum` when the user taps the Done button.

### Step 6

Call `scrum.update(from: data)` in the Done button’s closure.







```swift
}, trailing: Button("Done") {
                        isPresented = false
                        scrum.update(from: data)
                    })
            }
```

    



>Note

>    Xcode displays a compiler error because `scrum` is a constant.

### Step 7

Convert the `scrum` constant to a variable binding.

Using a binding ensures that `DetailView` re-renders when `scrum` is modified.





```swift
struct DetailView: View {
    @Binding var scrum: DailyScrum
    @State private var data: DailyScrum.Data = DailyScrum.Data()
    @State private var isPresented = false
```

    



### Step 8

Pass a constant binding to the `DetailView` initializer in `DetailView_Previews`.







```swift
static var previews: some View {
        NavigationView {
            DetailView(scrum: .constant(DailyScrum.data[0]))
        }
    }
```

    



The edit screen now passes changes back to the detail screen. But before you can view those changes in the app, you’ll need to finish passing bindings throughout the rest of the navigation hierarchy.



```swift
import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    @State private var data: DailyScrum.Data = DailyScrum.Data()
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
            data = scrum.data
        })
        .navigationTitle(scrum.title)
        .fullScreenCover(isPresented: $isPresented) {
            NavigationView {
                EditView(scrumData: $data)
                    .navigationTitle(scrum.title)
                    .navigationBarItems(leading: Button("Cancel") {
                        isPresented = false
                    }, trailing: Button("Done") {
                        isPresented = false
                        scrum.update(from: data)
                    })
            }
        }
    } 
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: .constant(DailyScrum.data[0]))
        }
    }
}
```

## Section 2 - Pass the Detail View a Binding to a Scrum

`ScrumsView` should reflect changes users make on the edit screen. To accomplish this, you need to pass a binding down the view hierarchy.

You’ll start by changing the `scrums` property from a constant to a binding. Then you’ll add a function that creates bindings to individual items in the `scrums` array, and pass those bindings to the detail view.

<img alt="" srcset="https://docs-assets.developer.apple.com/published/5ac8de0fdc3207b2618820d2403d386d/600/060-002.png 1x, https://docs-assets.developer.apple.com/published/26fbcbf22c375d45a1d528758904d9de/600/060-002@2x.png 2x" src="https://docs-assets.developer.apple.com/published/5ac8de0fdc3207b2618820d2403d386d/600/060-002.png" width="362" height="auto">



### Step 1

In `ScrumsView.swift`, convert the `scrums` constant to a binding.







```swift
struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]

    var body: some View {
```

    



### Step 2

In `ScrumsView_Previews`, pass a constant binding to the `ScrumsView` initializer.







```swift
static var previews: some View {
        NavigationView {
            ScrumsView(scrums: .constant(DailyScrum.data))
        }
    }
```

    



The `ForEach` view passes a scrum into its closure, but the `DetailView` initializer expects a binding to a scrum. You’ll add a utility method to retrieve a binding from an individual scrum.

### Step 3

Add a private method that accepts a `DailyScrum` and returns a `Binding<DailyScrum>`. Halt execution if the scrum doesn’t exist in the `scrums` array.







```swift
}

    private func binding(for scrum: DailyScrum) -> Binding<DailyScrum> {
        guard let scrumIndex = scrums.firstIndex(where: { $0.id == scrum.id }) else {
            fatalError("Can't find scrum in array")
        }
    }
}
```

    



### Step 4

Complete the method by returning a binding to the scrum.

The `$` prefix accesses the [projected value](https://developer.apple.com/documentation/swiftui/binding/projectedvalue) of a wrapped property. The projected value of the `scrums` binding is another binding.





```swift
fatalError("Can't find scrum in array")
        }
        return $scrums[scrumIndex]
    }
}
```

    



### Step 5

Pass a binding to the `DetailView` initializer.

Using the utility method to create the binding keeps the `DetailView` initializer concise.





```swift
List {
            ForEach(scrums) { scrum in
                NavigationLink(destination: DetailView(scrum: binding(for: scrum))) {
                    CardView(scrum: scrum)
                }
```

    





```swift
import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]

    var body: some View {
        List {
            ForEach(scrums) { scrum in
                NavigationLink(destination: DetailView(scrum: binding(for: scrum))) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.color)
            }
        }
        .navigationTitle("Daily Scrums")
        .navigationBarItems(trailing: Button(action: {}) {
            Image(systemName: "plus")
        })
    }

    private func binding(for scrum: DailyScrum) -> Binding<DailyScrum> {
        guard let scrumIndex = scrums.firstIndex(where: { $0.id == scrum.id }) else {
            fatalError("Can't find scrum in array")
        }
        return $scrums[scrumIndex]
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: .constant(DailyScrum.data))
        }
    }
}
```


## Section 3 -  Pass the List View a Binding

`ScrumdingerApp` defines the entry point and structure of your app. In this section, you’ll create the source of truth for your app’s data by adding a `@State` property to `ScrumdingerApp`. Then you’ll pass a binding to that data down the hierarchy to `ScrumsList`.

<img alt="" srcset="https://docs-assets.developer.apple.com/published/e0ae20d8fb8e2ce1a201962c87235258/600/060-003.png 1x, https://docs-assets.developer.apple.com/published/c3175f35e5106ffd5983b74e0c7a6701/600/060-003@2x.png 2x" src="https://docs-assets.developer.apple.com/published/e0ae20d8fb8e2ce1a201962c87235258/600/060-003.png" width="362" height="auto">



### Step 1

In `ScrumdingerApp.swift`, add a private `@State` property named `scrums`.

For now, you initialize the property with sample data.





```swift
@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.data
    var body: some Scene {
        WindowGroup {
```

    



### Step 2

Pass a binding to `scrums` to the `ScrumsView` initializer.







```swift
WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
```

    



>Note
> Updating `ScrumdingerApp` fixes the remaining compiler error.

### Step 3

Run Scrumdinger in Simulator and edit a scrum.

After you tap the Done button, the detail and list views should display the modified scrum.


>    Experiment
>
>   Open `ScrumsView` in Live Preview mode and try editing a scrum. Why are your changes discarded when you tap Done?



In this tutorial, you used `@State` to create a source of truth for a value type, and you used `@Binding` to share write access to a state with other views. In the next chapter, you’ll learn about some additional property wrappers that allow you to work with reference type data.

