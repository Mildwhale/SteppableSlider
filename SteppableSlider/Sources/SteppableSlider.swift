//
//  SteppableSlider.swift
//  SteppableSlider
//
//  Created by Kyujin Kim on 2020/02/25.
//  Copyright © 2020 Kyujin Kim. All rights reserved.
//

import UIKit

@IBDesignable open class SteppableSlider: UISlider {
    // MARK: - Value
    // MARK: IBInspectable
    @IBInspectable public var numberOfSteps: Int {
        get { return _numberOfSteps }
        set {
            _numberOfSteps = newValue
            updateStepValue()
        }
    }
    @IBInspectable public var useHapticFeedback: Bool {
        get { return _useHapticFeedback }
        set { _useHapticFeedback = newValue }
    }
    
    // MARK: Public
    public var currentStepIndex: Int { return _currentStepIndex }
    public var stepValue: Float { return _stepValue }

    // MARK: Private
    private var _numberOfSteps: Int = 0
    private var _currentStepIndex: Int = 0
    private var _stepValue: Float = 0
    private var _useHapticFeedback: Bool = false
    private var _isStepEnabled: Bool { return stepValue > 0 }
    private var _cachedValueForFeedback: Float = 0

    // MARK: Override
    override open var value: Float {
        get {
            guard _isStepEnabled else { return super.value }
            let newStepValue = round(super.value / _stepValue) * _stepValue
            if _useHapticFeedback {
                if _cachedValueForFeedback != newStepValue {
                    _cachedValueForFeedback = newStepValue

                    let generator = UISelectionFeedbackGenerator()
                    generator.selectionChanged()
                }
            }
            updateCurrentStep(of: newStepValue)
            return newStepValue
        }
        set {
            if _isStepEnabled {
                let newStepValue = round(newValue / _stepValue) * _stepValue
                super.value = newStepValue
            } else {
                super.value = newValue
            }
        }
    }
    
    // MARK: - Function
    // MARK: Private
    private func updateStepValue() {
        _stepValue = _numberOfSteps > 1 ? maximumValue / Float(_numberOfSteps - 1) : 0
    }
    
    private func updateCurrentStep(of nextValue: Float) {
        super.value = nextValue
        _currentStepIndex = Int(round(nextValue / stepValue))
    }
}
