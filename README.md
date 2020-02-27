# SteppableSlider

## Features
SteppableSlider is a custom UISlider that provides steps.

## Examples
### Set slider
```swift
let slider = SteppableSlider()
slider.numberOfSteps = 4
slider.useHapticFeedback = true // Default
slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
```

### Get step index
```swift
@objc func sliderValueChanged(_ sender: SteppableSlider) {
    print(sender.currentStepIndex) // 0 ~ 3
}
```

## Installation
### Carthage
```
github "Mildwhale/SteppableSlider" ~> 0.0.1
```

### CocoaPods
``` 
pod 'SteppableSlider', '~> 0.0.1' 
```

### Swift Package Manager
```
dependencies: [
    .package(url: "https://github.com/Mildwhale/SteppableSlider.git")
]
```

## Requirements
* iOS 10.0+  
* Swift 4+
