
# Getting Started

Learn the essentials of iOS app development by building a fully functional app using SwiftUI.

Before you start the course, take a few minutes to familiarize yourself with the background requirements, key concepts behind SwiftUI, and the app that you’ll build.

<!---->

5 min Estimated Time

<!---->

<!---->

## 關於本課程

這些教程是為SwiftUI新手而設計的。在開始之前，您需要了解一些有關Swift的知識，因此，請首先回顧一下Swift編程語言的[The Basics](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)。語法，數據類型和獨特的語言功能(例如可選)的概述。另外，請查看[Closures](https://docs.swift.org/swift-book/LanguageGuide/Closures.html)部分，因為您將在SwiftUI中頻繁使用它們。

## SwiftUI概述

SwiftUI是用於任何Apple平台構建應用程序的聲明性框架。使用SwiftUI通過一種語言和通用API定義應用程序的UI和行為。

借助以下關鍵的SwiftUI功能，可以更快，更少錯誤地創建應用程序：

* 聲明性語法-使用簡單的Swift結構定義在屏幕上顯示的視圖。您的視圖會自動保持最新狀態。

* 複合API-使用內置視圖和修飾符快速創建和迭代UI。通過合併更簡單的視圖來構成更複雜的視圖。

* 強大的佈局系統-當現有的視圖和控件無法滿足您的需求時，您可以自己繪製。

* 視圖反映了應用程序數據-定義視圖的數據依存關係，SwiftUI會在數據更改時自動更新視圖，從而避免了無效視圖狀態導致的錯誤。

* 自動輔助功能支持-SwiftUI添加了基本的輔助功能，您將學習到這些基本的輔助功能，從而可以輕鬆完成。




##應用程序之旅

許多軟件工程團隊使用稱為Scrum的日常會議來計劃其當天的工作。 Scrum是簡短的會議，每個參與者在會議上討論他們昨天的成就，今天的工作以及可能影響其工作的任何障礙。

本課程將指導您開發Scrumdinger，這是一個iOS應用程序，可幫助用戶管理其日常Scrum。為了幫助使Scrum簡短而集中，Scrumdinger使用視覺和音頻提示來指示每個與會者何時和多長時間發言。該應用程序還顯示進度視圖，顯示會議中剩餘的時間，並創建一個記錄，供用戶以後參考。

這是您在本課程中將要學習的內容的詳細介紹。

### Scrum 列表

該應用程序的主屏幕顯示了用戶每天的日常消費摘要。用戶可以點擊列表中的一行以查看Scrum的詳細信息，也可以通過點擊導航欄中的Add(+)按鈕來創建新的Scrum。

<picture data-v-6f999518=""><!----><img alt="Screenshot of list of scrums under Daily Scrums heading" srcset="https://docs-assets.developer.apple.com/published/0a6ca8a678102b11bf19cd5ee489a147/600/A010-002-001.png 1x, https://docs-assets.developer.apple.com/published/968cc808ec1b585c32edfde46c72cded/600/A010-002-001@2x.png 2x" src="https://docs-assets.developer.apple.com/published/0a6ca8a678102b11bf19cd5ee489a147/600/A010-002-001.png" width="287" height="auto"></picture>

### Scrum 詳細信息和編輯

詳細信息視圖顯示有關Scrum的更多信息，包括每個與會者的姓名和以前的會議列表。用戶可以通過點擊"編輯"按鈕來修改Scrum的任何屬性。點擊列表頂部的"開始會議"按鈕將啟動一個新的會議計時器。

<picture data-v-6f999518=""><!----><img alt="Screenshot of scrum details shown in grouped lists, including Meeting info, Attendees, and History" srcset="https://docs-assets.developer.apple.com/published/4d4f7cadb47ff1d6d232910c82b928e2/600/A010-002-002.png 1x, https://docs-assets.developer.apple.com/published/251d0bbb5276d29d4088900fe761225a/600/A010-002-002@2x.png 2x" src="https://docs-assets.developer.apple.com/published/4d4f7cadb47ff1d6d232910c82b928e2/600/A010-002-002.png" width="287" height="auto"></picture>

###會議計時器

會議計時器頂部的進度條顯示會議的經過時間和剩餘時間。該應用程序在屏幕中央顯示當前揚聲器的名稱，並在屏幕底部顯示一個前進至下一個揚聲器的按鈕。

每個與會者由圓形進度環中的一個部分錶示。與會者的時間到時，Scrumdinger會播放"叮"聲，並將新的片段添加到鈴聲中。鈴響了，會議結束了。

<picture data-v-6f999518=""><!----><img alt="Screenshot of meeting timer screen with three main sections" srcset="https://docs-assets.developer.apple.com/published/8fd7656901879e616d44d2239f7a68cd/600/A010-002-003.png 1x, https://docs-assets.developer.apple.com/published/d8f494c0fd9861bcdfcbb19ff4973d92/600/A010-002-003@2x.png 2x" src="https://docs-assets.developer.apple.com/published/8fd7656901879e616d44d2239f7a68cd/600/A010-002-003.png" width="255" height="auto"></picture>


##成功秘訣

*邊做邊學。每個教程都包括入門項目和已完成的項目。打開入門項目，並完成教程中的每個步驟。

*在學習中發揮積極作用。閱讀每個步驟，並在查看代碼差異之前考慮如何完成給定的任務。

*確保安裝了[最新版本的Xcode](https://apps.apple.com/us/app/xcode/id497799835?mt=12)。


##開始建設

既然您已經了解了Scrumdinger，現在就可以構建它了。而且不用擔心會卡住。您可以在學習教程時查看每個步驟的代碼差異，也可以下載並查看Xcode中已完成的項目。您也可以訪問[開發者論壇](https://developer.apple.com/forums/tags/swiftui)，以獲得有關各種開發主題的幫助。
