//
//  SteppableSlider.swift
//  SteppableSlider
//
//  Created by Kyujin Kim on 2020/02/25.
//  Copyright © 2020 Kyujin Kim. All rights reserved.
//

import UIKit

@IBDesignable open class SteppableSlider: UISlider {
    
    // MARK: IBInspectable
    @IBInspectable public var useHapticFeedback: Bool {
        get { return _useHapticFeedback }
        set { _useHapticFeedback = newValue }
    }
    @IBInspectable public var stepValue: Float {
        get { return _stepValue }
        set { _stepValue = newValue }
    }

    // MARK: Private
    private var _stepValue: Float = 0
    private var _useHapticFeedback: Bool = false
    
    private var isStepEnabled: Bool {
        return stepValue > 0
    }

    private var latestValueForFeedback: Float = 0

    // MARK: Override
    override open var value: Float {
        get {
            guard isStepEnabled else { return super.value }
            let newStepValue = round(super.value / stepValue) * stepValue
            if useHapticFeedback {
                if latestValueForFeedback != newStepValue {
                    latestValueForFeedback = newStepValue

                    let generator = UISelectionFeedbackGenerator()
                    generator.selectionChanged()
                }
            }
            return newStepValue
        }
        set {
            if isStepEnabled {
                let newStepValue = round(newValue / stepValue) * stepValue
                super.value = newStepValue
            } else {
                super.value = newValue
            }
        }
    }
}
