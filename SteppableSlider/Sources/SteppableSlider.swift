//
//  SteppableSlider.swift
//  SteppableSlider
//
//  Created by Kyujin Kim on 2020/02/25.
//  Copyright © 2020 Kyujin Kim. All rights reserved.
//

import UIKit

public protocol SteppableSliderDataSource: class {
    func numberOfSteps(in slider: SteppableSlider) -> Int
    func viewForSteps(in slider: SteppableSlider) -> UIView?
}

open class SteppableSlider: UISlider {
    // MARK: Public
    public var useStep: Bool = false
    public var useHapticFeedback: Bool = false
    public var expandThumbRectToEdges: Bool = false

    public weak var stepDataSource: SteppableSliderDataSource? {
        didSet {
            updateStepValue()
        }
    }

    // MARK: Private
    private var numberOfSteps: Int {
        return stepDataSource?.numberOfSteps(in: self) ?? 0
    }
    private var isStepEnabled: Bool {
        return useStep && stepValue > 0
    }

    private var stepValue: Float = 0
    private var latestValueForFeedback: Float = 0
    private var stepLineStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isUserInteractionEnabled = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()

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

    override open func layoutSubviews() {
        super.layoutSubviews()
        addStepLineIfNeeded()
    }

    override open func thumbRect(forBounds bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect {
        let unadjustedThumbrect = super.thumbRect(forBounds: bounds, trackRect: rect, value: value)
        guard expandThumbRectToEdges else { return unadjustedThumbrect }

        let thumbOffsetToApplyOnEachSide: CGFloat = unadjustedThumbrect.size.width / 2
        let minOffsetToAdd = -thumbOffsetToApplyOnEachSide
        let maxOffsetToAdd = thumbOffsetToApplyOnEachSide
        let offsetForValue = minOffsetToAdd + (maxOffsetToAdd - minOffsetToAdd) * CGFloat(value / (self.maximumValue - self.minimumValue))
        var origin = unadjustedThumbrect.origin
        origin.x += offsetForValue
        return CGRect(origin: origin, size: unadjustedThumbrect.size)
    }

    // MARK: Private
    private func updateStepValue() {
        stepValue = numberOfSteps > 1 ? maximumValue / Float(numberOfSteps - 1) : 0
    }

    private func addStepLineIfNeeded() {
        guard let dataSoruce = stepDataSource, numberOfSteps > 1, stepLineStackView.subviews.isEmpty else { return }

        for _ in 0 ..< dataSoruce.numberOfSteps(in: self) {
            guard let stepView = dataSoruce.viewForSteps(in: self) else { return }
            stepView.layer.zPosition = -1
            stepLineStackView.addArrangedSubview(stepView)
        }
        addSubview(stepLineStackView)

        stepLineStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stepLineStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stepLineStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
