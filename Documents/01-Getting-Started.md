
# Getting Started

Learn the essentials of iOS app development by building a fully functional app using SwiftUI.

Before you start the course, take a few minutes to familiarize yourself with the background requirements, key concepts behind SwiftUI, and the app that you’ll build.

<!---->

5 min Estimated Time

<!---->

<!---->

## About This Course

These tutorials are designed for experienced developers who are new to SwiftUI. You’ll need to know a bit about Swift before you begin, so start by reviewing [The Basics](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html) of the Swift programming language for an overview of syntax, data types, and unique language features, such as optionals. Review the [Closures](https://docs.swift.org/swift-book/LanguageGuide/Closures.html) section as well, because you’ll use them frequently in SwiftUI.

## SwiftUI Overview

SwiftUI is a declarative framework for building apps for any Apple platform. Use SwiftUI to define the UI and behavior of an app using a single language and common API.

Create apps more quickly and with fewer errors with these key SwiftUI features:

* Declarative syntax — Define what views appear on screen using simple Swift structures. Your views stay up to date automatically.

* Compositional API — Quickly create and iterate your UI using built-in views and modifiers. Compose more complex views by combining simpler views.

* Powerful layout system — When existing views and controls don’t suit your needs, you can draw your own.

* Views reflect app data — Define a view’s data dependencies and SwiftUI automatically updates the view when data changes, avoiding errors from invalid view states.

* Automatic accessibility support — SwiftUI adds basic accessibility that you’ll learn to enhance with minimal effort.


## Tour of the App

Many software engineering teams use daily meetings, known as scrums, to plan their work for the day. Scrums are short meetings where each attendee discusses what they accomplished yesterday, what they are working on today, and any obstacles that might impact their work.

This course guides you through the development of Scrumdinger, an iOS app that helps users manage their daily scrums. To help keep scrums short and focused, Scrumdinger uses visual and audio cues to indicate when and how long each attendee should speak. The app also displays a progress view that shows the time remaining in the meeting and creates a transcript that users can refer to later.

Here’s a closer look at what you’ll build in this course.

### Scrum List

The main screen of the app displays a summary of each of the user’s daily scrums. Users can tap a row in the list to view the details of a scrum or create a new scrum by tapping the Add (+) button in the navigation bar.

<picture data-v-6f999518=""><!----><img alt="Screenshot of list of scrums under Daily Scrums heading" srcset="https://docs-assets.developer.apple.com/published/0a6ca8a678102b11bf19cd5ee489a147/600/A010-002-001.png 1x, https://docs-assets.developer.apple.com/published/968cc808ec1b585c32edfde46c72cded/600/A010-002-001@2x.png 2x" src="https://docs-assets.developer.apple.com/published/0a6ca8a678102b11bf19cd5ee489a147/600/A010-002-001.png" width="287" height="auto"></picture>

### Scrum Detail and Edit

The detail view shows more information about a scrum, including the name of each attendee and a list of previous meetings. Users can modify any of the scrum’s attributes by tapping the Edit button. Tapping the Start Meeting button at the top of the list starts a new meeting timer.

<picture data-v-6f999518=""><!----><img alt="Screenshot of scrum details shown in grouped lists, including Meeting info, Attendees, and History" srcset="https://docs-assets.developer.apple.com/published/4d4f7cadb47ff1d6d232910c82b928e2/600/A010-002-002.png 1x, https://docs-assets.developer.apple.com/published/251d0bbb5276d29d4088900fe761225a/600/A010-002-002@2x.png 2x" src="https://docs-assets.developer.apple.com/published/4d4f7cadb47ff1d6d232910c82b928e2/600/A010-002-002.png" width="287" height="auto"></picture>

### Meeting Timer

The progress bar at the top of the meeting timer shows the elapsed and remaining time for the meeting. The app displays the name of the current speaker in the center of the screen and a button to advance to the next speaker at the bottom of the screen.

Each attendee is represented by a segment in a circular progress ring. When an attendee’s time is up, Scrumdinger plays a “ding” sound and adds a new segment to the ring. The meeting is over when the ring is full.

<picture data-v-6f999518=""><!----><img alt="Screenshot of meeting timer screen with three main sections" srcset="https://docs-assets.developer.apple.com/published/8fd7656901879e616d44d2239f7a68cd/600/A010-002-003.png 1x, https://docs-assets.developer.apple.com/published/d8f494c0fd9861bcdfcbb19ff4973d92/600/A010-002-003@2x.png 2x" src="https://docs-assets.developer.apple.com/published/8fd7656901879e616d44d2239f7a68cd/600/A010-002-003.png" width="255" height="auto"></picture>

## Tips for Success

* Learn best by doing. Each tutorial includes starter and completed projects. Open the starter project and complete each step in the tutorial.

* Take an active role in your learning. Read each step and think about how you would accomplish the given task before you view the code diff.

* Make sure you install the [latest version of Xcode](https://apps.apple.com/us/app/xcode/id497799835?mt=12).


## Start Building

Now that you’ve seen Scrumdinger, it’s time to build it. And don’t worry if you get stuck. You can view the code diffs for each step as you work through a tutorial, or you can download and review the completed project in Xcode. You can also visit the [Developer Forums](https://developer.apple.com/forums/tags/swiftui) for help on a variety of development topics.
