//
//  SteppableSlider+Rx.swift
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
import RxSwift
import RxCocoa
import SteppableSlider

extension Reactive where Base: SteppableSlider {
    /// Reactive wrapper for `numberOfSteps` property.
    public var numberOfSteps: ControlProperty<Int> {
        return base.rx.controlProperty(editingEvents: .valueChanged, getter: { base in
            return base.numberOfSteps
        }, setter: { base, value in
            base.numberOfSteps = value
            base.sendActions(for: .valueChanged)
        })
    }
    
    /// Reactive wrapper for `useHapticFeedback` property.
    public var useHapticFeedback: ControlProperty<Bool> {
        return base.rx.controlProperty(editingEvents: .valueChanged, getter: { base in
            return base.useHapticFeedback
        }, setter: { base, value in
            base.useHapticFeedback = value
            base.sendActions(for: .valueChanged)
        })
    }
    
    /// Reactive wrapper for `currentIndex` property.
    public var currentIndex: ControlProperty<Int> {
        return base.rx.controlProperty(editingEvents: .valueChanged, getter: { base in
            return base.currentIndex
        }, setter: { base, value in
            base.setIndex(value)
            base.sendActions(for: .valueChanged)
        })
    }
}
