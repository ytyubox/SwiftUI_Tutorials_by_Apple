

#         Using Stacks to Arrange Views

Using the declarative syntax of SwiftUI, you can quickly create, modify, and combine views to compose your app’s UI. You’ll start building Scrumdinger, an app for managing scrum meetings, by arranging groups of views to create the first iteration of the meeting timer screen. As you progress through the course, you’ll revisit the timer screen as you work toward the final design.

Follow the steps below to get started with your new project, or open the finished project and explore the code on your own.

<!---->

15

min

Estimated Time


[Project files__](https://docs-assets.developer.apple.com/published/e52d419554bba3289ee78d94baaa2ae4/600/UsingStacksToArrangeViews.zip)

## Section 1 Create a Project

Throughout this course, you’ll learn the essentials of app development by creating Scrumdinger. You’ll explore the fundamentals of Xcode and SwiftUI as you add new features to the app. In this section, you’ll create the Xcode project for Scrumdinger.

<picture data-v-6f999518=""><!----><img alt="Diagram of Xcode project contents: source files, configuration files, and build settings" srcset="https://docs-assets.developer.apple.com/published/5f5076ace2ee6767719bd41aa6779ab2/600/010-005-intro@2x.png 2x" src="https://docs-assets.developer.apple.com/published/5f5076ace2ee6767719bd41aa6779ab2/600/010-005-intro@2x.png" width="234" height="auto"></picture>

<!---->

### Step 1

Create a new project using the iOS App template.

<!---->

<img alt="Screenshot of Xcode template selection screen highlighting iOS App template" srcset="https://docs-assets.developer.apple.com/published/9cd3c6f0db159b8b71acc01543055316/600/010-010-005.png 1x, https://docs-assets.developer.apple.com/published/7288ec54d0262ac03c65083b769db374/600/010-010-005@2x.png 2x" src="https://docs-assets.developer.apple.com/published/9cd3c6f0db159b8b71acc01543055316/600/010-010-005.png" width="531" height="auto">

<!---->

### Step 2

In the project options, name the product “Scrumdinger,” click the Interface pop-up menu and choose SwiftUI, then click the Life Cycle pop-up menu and choose SwiftUI App.

The template includes a starter file for your root view, `ContentView.swift`, and a file that defines the entry point for your app, `ScrumdingerApp
.swift`.


<img alt="Screenshot of Xcode new project screen highlighting Interface and Life Cycle pop-up menus" srcset="https://docs-assets.developer.apple.com/published/28eeb2046b94e5c7b17c034059c601a8/600/010-010-010.png 1x, https://docs-assets.developer.apple.com/published/b0689be017dff4cb39838c5520cd8313/600/010-010-010@2x.png 2x" src="https://docs-assets.developer.apple.com/published/28eeb2046b94e5c7b17c034059c601a8/600/010-010-010.png" width="531" height="auto">




##        Section 2 - Create Groups of Views

Views define a piece of your UI. They’re the building blocks of your app, and each view should be small and focused. You build a complex view by composing it of small, simple views. In this section, you’ll build the header of the timer screen to display the elapsed time and remaining time of a meeting.

<img alt="Wireframe of app with pins that show ProgressView, Text, Label, HStack, and VStack" srcset="https://docs-assets.developer.apple.com/published/8db81b16e614c72abc8f1d8dfcffae9f/600/010-010-intro.png 1x, https://docs-assets.developer.apple.com/published/52ecf4fe15cc0adf94eb45b9b7d113fe/600/010-010-intro@2x.png 2x" src="https://docs-assets.developer.apple.com/published/8db81b16e614c72abc8f1d8dfcffae9f/600/010-010-intro.png" width="362" height="auto">

<!---->

### Step 1

Open `ContentView.swift`.

The default SwiftUI view file declares two structures. The first structure conforms to the `View` protocol, which has a single requirement — a `body` property that returns a `View`. In the `body` property, you describe the content, layout, and behavior of the view. The second structure declares a preview for that view to display on the canvas.

<!---->

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```


<!---->

> You’ll refactor `ContentView.swift` to give it a name that’s specific to your app’s purpose.

### Step 2

Control-click the `ContentView` structure, choose Refactor > Rename, and rename the structure to `MeetingView`.

You can also rename the preview structure to `MeetingView_Previews` for naming consistency.

<!---->

### Step 3

Replace the contents of the existing body with `ProgressView`, initializing the view with placeholder data.

> You’ll use the progress view to display the percentage of time elapsed during the scrum. Progress views can also show indeterminate progress, like when loading a screen.

<!---->


```swift
struct MeetingView: View {
    var body: some View {
        ProgressView(value: 5, total: 15)
    }
}
```

[    Preview
  ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

### Step 4

On the canvas, click Resume to display the preview.

When you select a SwiftUI file in the Project navigator, the canvas opens alongside the editor. The canvas shows you a preview of what the view looks like when it runs.

>   Tip
>   You can press Option-Command-Return to show and hide the canvas. You can press Option-Command-P to resume or refresh a preview in the canvas.


<img alt="Screenshot of canvas highlighting Resume button" srcset="https://docs-assets.developer.apple.com/published/4b510b920e99c73bc31393bce9f643f4/600/010-010-050.png 1x, https://docs-assets.developer.apple.com/published/ee50127e658c859d9218d05bdcc03937/600/010-010-050@2x.png 2x" src="https://docs-assets.developer.apple.com/published/4b510b920e99c73bc31393bce9f643f4/600/010-010-050.png" width="531" height="auto">


### Step 5

Command-click `ProgressView` and select Embed in VStack.

Stacks group views horizontally, vertically, or back to front. You use stacks to combine and layer view components.

<!---->

[MeetingView.swift](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

```swift
struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
        }
    }
}
```


### Step 6

Create an `HStack` in the code editor, then click the Library button and drag a `Text` view inside the `HStack` with the value `Seconds Elapsed`.

Your code stays updated, whether you use the source editor, the canvas, the library, or the inspectors to modify your view.


>    Tip
>    You can press Shift-Command-L to open the library.

<!---->

[MeetingView.swift
    ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

```swift
VStack {
            ProgressView(value: 5, total: 15)
            HStack {
                Text("Seconds Elapsed")
            }
        }
    }
```

[    Preview
  ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

### Step 7

Add another `Text` view with the value `Seconds Remaining`.


[MeetingView.swift
    ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

```swift
HStack {
                Text("Seconds Elapsed")
                Text("Seconds Remaining")
            }
        }
```

[    Preview
  ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

### Step 8

Embed each `Text` view in a `VStack`.

<!---->

<!---->

[MeetingView.swift
    ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

```swift
ProgressView(value: 5, total: 15)
            HStack {
                VStack {
                    Text("Seconds Elapsed")
                }
                VStack {
                    Text("Seconds Remaining")
                }
            }
        }
```


<!---->

### Step 9

Add a `Label` below the first `Text` view with a `title` of `300` and `systemImage` of `hourglass.bottomhalf.fill`.

The image uses one of the included [SF Symbols](https://developer.apple.com/sf-symbols/). The system treats these symbols like fonts, so they scale dynamically with a user’s device settings.

<!---->

[MeetingView.swift
    ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

```swift
VStack {
                    Text("Seconds Elapsed")
                    Label("300", systemImage: "hourglass.bottomhalf.fill")
                }
                VStack {
```

[    Preview
  ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

### Step 10

Add a `Label` below the second `Text` view with a `title` of `600` and `systemImage` of `hourglass.tophalf.fill`.

<!---->

<!---->

[MeetingView.swift
    ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

```swift
VStack {
                    Text("Seconds Remaining")
                    Label("600", systemImage: "hourglass.tophalf.fill")
                }
            }
```

[    Preview
  ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

MeetingView.swift

```swift
import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
            HStack {
                VStack {
                    Text("Seconds Elapsed")
                    Label("300", systemImage: "hourglass.bottomhalf.fill")
                }
                VStack {
                    Text("Seconds Remaining")
                    Label("600", systemImage: "hourglass.tophalf.fill")
                }
            }
        }
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
```



<picture data-v-6f999518=""><!----><img alt="Screenshot of canvas with hourglass image and 600 below Seconds Remaining" srcset="https://docs-assets.developer.apple.com/published/6c40caa84f3d67b6510a202980ba703a/600/010-010-110-preview.png 1x" src="https://docs-assets.developer.apple.com/published/6c40caa84f3d67b6510a202980ba703a/600/010-010-110-preview.png" width="834" height="auto"></picture>

## Section 3  Modify and Style Views

Now that you’ve created the basic views within the header, you’ll prototype and style the remainder of the meeting timer screen. You’ll add built-in modifiers to adjust the appearance of the header. You’ll also create additional stacks and views, and start adding controls.

<img alt="Wireframe of timer header with pins that show .font(.caption), alignment: .leading, Spacer, and alignment: .trailing" srcset="https://docs-assets.developer.apple.com/published/ea0b072f1a9ae87af53a8ae0fcb64b65/600/010-020-intro.png 1x, https://docs-assets.developer.apple.com/published/d8ce04b762d67d79f0881a521b74f8b1/600/010-020-intro@2x.png 2x" src="https://docs-assets.developer.apple.com/published/ea0b072f1a9ae87af53a8ae0fcb64b65/600/010-020-intro.png" width="362" height="auto">

<!---->

You’ll start styling the header by adjusting the spacing of the views.

### Step 1

Add `Spacer()` between each `VStack` to consume available space from the containing parent view.

<!---->

<!---->

[MeetingView.swift
    ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

```swift
Label("300", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack {
                    Text("Seconds Remaining")
```

[    Preview
  ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

### Step 2

Add a leading alignment in the `VStack` surrounding “Seconds Elapsed” and a trailing alignment in the `VStack` surrounding “Seconds Remaining.”

These alignments override the default behavior, which is center alignment. Some systems use left and right alignment. SwiftUI uses leading and trailing alignment to ease the localization of your app.

>    Tip
>   You can also set the alignment by selecting the `VStack` and using the Alignment options in the Attributes inspector.


<!---->

[MeetingView.swift
    ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

```swift
ProgressView(value: 5, total: 15)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                    Label("300", systemImage: "hourglass.bottomhalf.fill")
```

[    Preview
  ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

### Step 3

Add  a `.font(.caption)` modifier to the `Text` views to reduce the size of the text.

To customize a SwiftUI view, you call methods known as _modifiers_. Each modifier returns a new view. You can use multiple modifiers on a single view. To chain modifiers, stack them vertically.

<!---->

[MeetingView.swift
    ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

```swift
VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.bottomhalf.fill")
                }
```

[    Preview
  ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

Now that the header has the appropriate spacing, you’ll create a placeholder for the timer ring that appears in the center of the screen.

### Step 4

Add a `Circle` shape with a border as a placeholder.

You’ll refine the design of the timer ring in later tutorials.

<!---->

[MeetingView.swift
    ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

```swift
}
            }
            Circle()
                .strokeBorder(lineWidth: 24, antialiased: true)
        }
    }
```

[    Preview
  ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

Finish prototyping the meeting timer screen by creating the footer.

### Step 5

Add an `HStack` with a `Text` view that displays “Speaker 1 of 3.”


[MeetingView.swift
    ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

```swift
Circle()
                .strokeBorder(lineWidth: 24, antialiased: true)
            HStack {
                Text("Speaker 1 of 3")
            }
        }
    }
```

[    Preview
  ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

### Step 6

Add a `Button` that uses the `forward.fill` image as its label.

Leave the button action empty for now. In a later tutorial, you’ll make the action advance the timer ring to the next speaker.

<!---->

[MeetingView.swift
    ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

```swift
HStack {
                Text("Speaker 1 of 3")
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }
            }
        }
```

[    Preview
  ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

### Step 7

Add `Spacer()` between `Text` and `Button`.


[MeetingView.swift
    ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

```swift
HStack {
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "forward.fill")
```

[    Preview
  ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

### Step 8

Add padding to the top-level `VStack` to bring the views in from the edges.

<!---->

<!---->

[MeetingView.swift
    ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

```swift
}
        }
        .padding()
    }
}
```

[    Preview
  ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

MeetingView.swift

```swift
import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.tophalf.fill")
                }
            }
            Circle()
                .strokeBorder(lineWidth: 24, antialiased: true)
            HStack {
                Text("Speaker 1 of 3")
            }
        }
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
```

<button data-v-b4b513b2="" class="header"><span data-v-b4b513b2="" class="runtime-preview-label">Preview</span><span data-v-b4b513b2="" aria-label="Hide" class="preview-hide">↗</span></button>

<picture data-v-6f999518=""><!----><img alt="Screenshot of canvas showing Speaker 1 of 3 at bottom of screen" srcset="https://docs-assets.developer.apple.com/published/014ad120dbbc15cdc6666596e6c06f65/600/010-020-060-preview.png 1x" src="https://docs-assets.developer.apple.com/published/014ad120dbbc15cdc6666596e6c06f65/600/010-020-060-preview.png" width="834" height="auto"></picture>

[          Section 4
        ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#Supplement-Accessibility-Data)

##         Supplement Accessibility Data

Accessibility is built into SwiftUI, so you get accessibility support with little additional work. For example, string content in `Text` views is automatically accessible to device features like [VoiceOver](https://www.apple.com/accessibility/iphone/vision/). But there are times when you’ll want to supplement the inferred data to enhance the accessibility experience for your users.

<picture data-v-6f999518=""><!----><img alt="Wireframe of meeting timer view with pins showing accessibility label and value pointing to header and accessibility label and traits pointing to button" srcset="https://docs-assets.developer.apple.com/published/d4d52ecafcdb0c79d680068091759afa/600/010-030-intro.png 1x, https://docs-assets.developer.apple.com/published/43bdef80c6f7f5dffdb6d5c9ea269c3f/600/010-030-intro@2x.png 2x" src="https://docs-assets.developer.apple.com/published/d4d52ecafcdb0c79d680068091759afa/600/010-030-intro.png" width="362" height="auto"></picture>

<!---->

By default, VoiceOver reads system names for the images in the header: `hourglass
.bottomhalf
.fill` and `hourglass
.tophalf
.fill`.

### Step 1

Ignore the inferred accessibility labels and values for the child views of the `HStack` in the header.

Adding supplemental data in the next few steps improves the accessibility experience.

<!---->

[MeetingView.swift
    ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

```
}
            }
            .accessibilityElement(children: .ignore)
            Circle()
                .strokeBorder(lineWidth: 24, antialiased: true)
```

    No preview

<!---->

### Step 2

Add an accessibility label to the `HStack`, passing a meaningful name for the label.

Consider if there’s enough context in the labels and values for users to understand the purpose of the element. In this case, rather than force VoiceOver users to listen to the output of both labels, you can supplement the data with one label that surfaces the most important information.

<!---->

[MeetingView.swift
    ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

```
}
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(Text("Time remaining"))
            Circle()
                .strokeBorder(lineWidth: 24, antialiased: true)
```

    No preview

<!---->

### Step 3

Add an accessibility value for the time remaining to the `HStack`.

Because you intentionally ignored the values in the child views, you need to add a value to the `HStack`. SwiftUI would otherwise infer the values of the child views automatically.

<!---->

[MeetingView.swift
    ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

```
.accessibilityElement(children: .ignore)
            .accessibilityLabel(Text("Time remaining"))
            .accessibilityValue(Text("10 minutes"))
            Circle()
                .strokeBorder(lineWidth: 24, antialiased: true)
```

    No preview

<!---->

### Step 4

Add an accessibility label to describe the forward button.

VoiceOver reads the label “Next speaker,” followed by the inherent accessibility trait “Button.”

<!---->

[MeetingView.swift
    ](https://developer.apple.com/tutorials/app-dev-training/using-stacks-to-arrange-views#)

```
Image(systemName: "forward.fill")
                }
                .accessibilityLabel(Text("Next speaker"))
            }
        }
```

    No preview

<!---->

With these four modifiers, you just enhanced the accessibility experience for users.

Before you continue to the next lesson, take a moment to reflect on the progress you’ve made. You used the basic building blocks of SwiftUI: views, stacks, and modifiers. You prototyped a view that already resembles the final timer design. And you made the accessibility experience more meaningful. You did all this in one lesson and about 40 lines of code.

MeetingView.swift

```swift
import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.tophalf.fill")
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(Text("Time remaining"))
            Circle()
                .strokeBorder(lineWidth: 24, antialiased: true)
            HStack {
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }
            }
        }
        .padding()
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
```
