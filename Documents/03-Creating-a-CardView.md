
#         Creating a CardView

Scrumdinger keeps a list of daily scrums that the user attends, and displays that list in its root view.

In this tutorial, you’ll build a `CardView` that displays a summary of a daily scrum. In the next tutorial, you’ll build a `List` view that uses this `CardView` in each row of the `List`.

Download the starter project and follow along with this tutorial, or open the finished project and explore the code on your own.



15 min Estimated Time

[Project files__](https://docs-assets.developer.apple.com/published/a2526dd40b9f66ed191b04dcb7df5904/600/CreatingACardView.zip)

## Section 1  Create a DailyScrum Model

The DailyScrum model will contain the following four properties, all with simple value types: `title`, `attendees`, `lengthInMinutes`, and `color`. Because `DailyScrum` will primarily carry value data, you’ll make it a value type by declaring it as a `struct`.

<img alt="Diagram of DailyScrum structure and its properties" srcset="https://docs-assets.developer.apple.com/published/97efdae3a8e15cb4ba52eef99d0aedc0/600/020-010-intro.png 1x, https://docs-assets.developer.apple.com/published/8ce46c85026b51b0304d908b44a7c156/600/020-010-intro@2x.png 2x" src="https://docs-assets.developer.apple.com/published/97efdae3a8e15cb4ba52eef99d0aedc0/600/020-010-intro.png" width="362" height="auto">



### Step 1

Add a new Swift file named `DailyScrum` to the Models group.



<img alt="Screenshot of Xcode creating new SwiftUI view file" srcset="https://docs-assets.developer.apple.com/published/1da75e07cfca2a950ce9a071fe99516a/600/020-010-010.png 1x, https://docs-assets.developer.apple.com/published/f79d14e8d8698e5bbf837bf7003de5b0/600/020-010-010@2x.png 2x" src="https://docs-assets.developer.apple.com/published/1da75e07cfca2a950ce9a071fe99516a/600/020-010-010.png" width="531" height="auto">



### Step 2

Import SwiftUI.







```swift
import SwiftUI
```



SwiftUI defines the `Color` structure you need for the next step.

### Step 3

Add a structure of type `DailyScrum` with `title`, `attendees`, `lengthInMinutes`, and `color` properties.







```swift
import SwiftUI

struct DailyScrum {
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var color: Color
}
```



### Step 4

Add an extension that provides some test data.

The starting project includes the `random` static property on `Color`.





```swift
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
```

    



DailyScrum.swift

```swift
import SwiftUI

struct DailyScrum {
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var color: Color
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
```


##       Section 2 Create the Card View

`CardView` will summarize the `DailyScrum` model data and display the title, the number of participants, and the duration. You’ll compose the `CardView` from smaller views, each of which displays a piece of data in the `DailyScrum` structure.

You’ll update the structure `CardView_Previews` so that you get immediate visual feedback as you develop the view.

<img alt="Diagram of DailyScrum structure and properties. The properties are connected to the related view inside CardView." srcset="https://docs-assets.developer.apple.com/published/c52624175dd3272023826ecb088a5945/600/020-020-intro.png 1x, https://docs-assets.developer.apple.com/published/bcc923c8a85c149e4d531b02e48fbbca/600/020-020-intro@2x.png 2x" src="https://docs-assets.developer.apple.com/published/c52624175dd3272023826ecb088a5945/600/020-020-intro.png" width="362" height="auto">



### Step 1

Add a new SwiftUI View file named `CardView`.






```swift
import SwiftUI

struct CardView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
```

### Step 2

Add a constant named `scrum` of type `DailyScrum`.



```swift
struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        Text("Hello, World!")
```



>    Note

  >  Xcode marks your `CardView()` initialization as a syntax error because the initializer now requires a `DailyScrum` parameter. You’ll fix this issue in the next step.


### Step 3

In `CardView_Previews`, create a static variable `scrum`, and pass it to the `CardView` initializer.






```swift
struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.data[0]
    static var previews: some View {
        CardView(scrum: scrum)
```



### Step 4

Specify a background color for the preview, and fix the preview size using the `previewLayout` modifier.

Setting the preview layout and background color presents `CardView` as it’ll appear inside a `List` view. You’ll embed the view in a list in the next tutorial.





```swift
static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.color)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
```

### Step 5

Update the `Text` view to show the title of the scrum, and set the font style to headline.







```swift
let scrum: DailyScrum
    var body: some View {
        Text(scrum.title)
            .font(.headline)
    }
}
```



### Step 6

Embed the `Text` view inside a `VStack` with leading alignment.

A `VStack` arranges child views in a vertical line and takes an `alignment` argument to position views along the horizontal axis.





```swift
let scrum: DailyScrum
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
        }
    }
}
```

    



### Step 7

Add a `Spacer` followed by an `HStack` that embeds a `Label` for displaying the number of attendees.

Remember that `Label` and `Image` use slightly different parameter labels for an SF Symbol: `Label(_:systemImage:)` as opposed to `Image(systemName:_)`





```swift
Text(scrum.title)
                .font(.headline)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
            }
        }
    }
```



### Step 8

Add a `Spacer` and a `Label` displaying the meeting length.







```swift
HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
            }
        }
```



### Step 9

Add 20 points of trailing padding to the meeting length `Label`.

<aside data-v-c567d8a8="" aria-label="tip" class="tip">
    Tip

    You can also add padding to the `.leading`, `.top`, and `.bottom` edges of a view.
</aside>





```swift
Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .padding(.trailing, 20)
            }
        }
```


### Step 10

Style all the fonts inside the `HStack` as captions.

SF Symbols used in labels and images scale and align appropriately with changes in font weight and size.



```swift
.padding(.trailing, 20)
            }
            .font(.caption)
        }
    }
```

### Step 11

Add padding to the `VStack`, and set the `foregroundColor` using the `accessibleFontColor` property on the scrum color.

`accessibleFontColor` is a property defined in the starting project. It returns either black or white, depending on how light or dark the scrum color is.



```swift
.font(.caption)
        }
        .padding()
        .foregroundColor(scrum.color.accessibleFontColor)
    }
}
```

Visually, `CardView` is complete and you can display it in a list. Before you do that, you’ll use accessibility modifiers to improve the experience for VoiceOver users.



```swift
import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .padding(.trailing, 20)
            }
            .font(.caption)
        }
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
```

<img alt="Screenshot of canvas with view displaying bottom row of small text and icons" srcset="https://docs-assets.developer.apple.com/published/d13b262404b276b372666fe374969bec/600/020_020-100.png 1x" src="https://docs-assets.developer.apple.com/published/d13b262404b276b372666fe374969bec/600/020_020-100.png" width="776" height="auto">


##    section 3 Make CardView Accessible

Now that `CardView` is laid out visually, you’ll make it accessible to all users. You’ll add accessibility modifiers to your views to make understanding and navigating your interface in VoiceOver easier.



<article data-v-56b09d3e="" data-v-76d1ab12="" class="body-content expanded-intro">
    <img alt="Wireframe of view with number 10 and clock icon highlighted" srcset="https://docs-assets.developer.apple.com/published/4620c2520c173a94c3a45427995a9a64/600/020-030-1-intro.png 1x, https://docs-assets.developer.apple.com/published/b0e4400d27bbca51da5922584fa8eaee/600/020-030-1-intro@2x.png 2x" src="https://docs-assets.developer.apple.com/published/4620c2520c173a94c3a45427995a9a64/600/020-030-1-intro.png" width="245" height="auto">

    The CardView contains a label with an image of a clock and a number that represents meeting length.

    <img alt="Diagram of view info showing Label: 10 and Type: text" srcset="https://docs-assets.developer.apple.com/published/a834cc4104d6e291ce625d2e4ad5f879/600/020-030-2-intro.png 1x, https://docs-assets.developer.apple.com/published/ae0a0ba656726d9fa59242299d59011a/600/020-030-2-intro@2x.png 2x" src="https://docs-assets.developer.apple.com/published/a834cc4104d6e291ce625d2e4ad5f879/600/020-030-2-intro.png" width="245" height="auto">

    The default accessibility options assign the view with a label of 10 and no value. VoiceOver reads, “10 Text.”

    <img alt="Diagram of view info showing Label: Meeting length and value: 10 minutes" srcset="https://docs-assets.developer.apple.com/published/eb783b7cb13676654451467dd278a60e/600/020-030-3-intro.png 1x, https://docs-assets.developer.apple.com/published/4a2c2769a4d09e6539cddbcca4f09178/600/020-030-3-intro@2x.png 2x" src="https://docs-assets.developer.apple.com/published/eb783b7cb13676654451467dd278a60e/600/020-030-3-intro.png" width="245" height="auto">

    With the accessibility labels, the label and value are meaningful descriptions of the view. VoiceOver reads, “Meeting length: 10 minutes.”
</article>

### Step 1

Add an `accessibilityElement` modifier to the attendee count label, ignoring children.







```swift
HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityElement(children: .ignore)
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
```

    



### Step 2

Use accessibility modifiers to add a label and a value that describe the contents of the first `Label` in `HStack`.

Capitalize the text inside the `accessibilityLabel` modifier to help VoiceOver give the proper enunciation.





```swift
Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Attendees"))
                    .accessibilityValue(Text("\(scrum.attendees.count)"))
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
```

    



### Step 3

Add similar accessibility modifiers to the second `Label` in `HStack`.







```swift
Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .padding(.trailing, 20)
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Meeting length"))
                    .accessibilityValue(Text("\(scrum.lengthInMinutes) minutes"))
            }
            .font(.caption)
```

    



The next tutorial shows you how to use `CardView` within a SwiftUI `List`. You’ll see how SwiftUI makes it easy to compose a large complicated view from smaller views like the one you just created.

CardView.swift

```swift
import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Attendees"))
                    .accessibilityValue(Text("\(scrum.attendees.count)"))
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
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
        CardView()
            .background(scrum.color)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
```
