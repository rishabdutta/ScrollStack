# ScrollStack
This project demonstrates how to resize/update UIStackView elements (horizontally) inside a UIScrollView automatically.  

Methods like `layoutIfNeeded()` doesn't work. 

As per Apple [docs](https://developer.apple.com/documentation/uikit/uistackview) the UIStackView subviews' 
layout are updated when one of those subview are either added, removed or hidden.

So in order to update the layout automatically we need to perform the following three line

```swift
let firstView = stackView.arrangedSubviews[0]
firstView.isHidden = true
firstView.isHidden = false
```

This is so stupid but works flawlessly.

Let me know if anybody finds a less stupid solution than this :laughing: 
