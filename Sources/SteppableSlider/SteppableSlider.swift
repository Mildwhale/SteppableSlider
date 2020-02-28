//
//  SteppableSlider.swift
//  The MIT License (MIT)
//
//  Copyright (c) 2020 Kyujin Kim
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

/// SteppableSlider is a custom UISlider that provides steps.
@IBDesignable open class SteppableSlider: UISlider {
    // MARK: - Value
    // MARK: IBInspectable
    
    /// Number of steps for slider and it must greater than one. The default value of this property is zero.
    @IBInspectable public var numberOfSteps: Int {
        get { return _numberOfSteps }
        set {
            _numberOfSteps = newValue
            updateStepValue()
        }
    }
    /// Determines whether haptic feedback is used when steps change. The default value of this property is true.
    @IBInspectable public var useHapticFeedback: Bool {
        get { return _useHapticFeedback }
        set {
            _useHapticFeedback = newValue
        }
    }
    
    // MARK: Public
    
    /// Get the index of the current step. This starts at zero.
    public var currentIndex: Int { return _currentIndex }

    // MARK: Private
    private var _numberOfSteps: Int = 0
    private var _currentIndex: Int = 0
    private var _stepValue: Float = 0
    private var _useHapticFeedback: Bool = false
    private var _isStepEnabled: Bool { return _stepValue > 0 }
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
            updateCurrentIndex(of: newStepValue)
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
    // MARK: Public
    public func setIndex(_ index: Int) {
        guard index >= 0, index < numberOfSteps else { return }
        let nextValue = _stepValue * Float(index)
        updateCurrentIndex(of: nextValue)
    }
    
    // MARK: Private
    private func updateStepValue() {
        _stepValue = _numberOfSteps > 1 ? maximumValue / Float(_numberOfSteps - 1) : 0
    }
    
    private func updateCurrentIndex(of nextValue: Float) {
        super.value = nextValue
        _currentIndex = Int(round(nextValue / _stepValue))
    }
}
