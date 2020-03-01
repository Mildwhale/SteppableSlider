# SteppableSlider
`SteppableSlider` is a custom UISlider that provides step.

![image](https://mildwhale.github.io/assets/images/steppableslider-sample.gif)

## Features
* `RxSwift` is supported.
* Support `Haptic feedback` on `.valueChanged`.

## Usage
You can use `SteppableSlider` with code or storyboard. Its fully compatible for interface builder.

### Swift
```swift
import SteppableSlider

let slider = SteppableSlider()
slider.numberOfSteps = 4
slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)

@objc func sliderValueChanged(_ sender: SteppableSlider) {
    print(sender.currentStepIndex) // 0 ~ 3
}
```

### RxSwift
```swift
import RxSteppableSlider

let slider = SteppableSlider()
slider.numberOfSteps = 4

slider.rx.currentIndex
    .subscribe(onNext: { [weak self] index in
        print(index) // 0 ~ 3
    })
    .disposed(by: disposeBag)
```

## Installation
### Carthage
```
github "Mildwhale/SteppableSlider" ~> 0.1.0
```

### CocoaPods
``` 
pod 'SteppableSlider', '~> 0.1.0'

or 

pod 'SteppableSlider/RxSwift', '~> 0.1.0'
```

### Swift Package Manager
```
https://github.com/Mildwhale/SteppableSlider.git

or

dependencies: [
    .package(url: "https://github.com/Mildwhale/SteppableSlider.git")
]
```

## Requirements
* iOS 10.0+  
* Swift 4+
