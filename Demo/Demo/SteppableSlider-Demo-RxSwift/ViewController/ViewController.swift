//
//  ViewController.swift
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
import SteppableSlider
import RxSteppableSlider

final class ViewController: UIViewController {
    @IBOutlet private var slider: SteppableSlider!
    @IBOutlet private var valueLabel: UILabel!
    @IBOutlet private var useHapticFeedbackSwitch: UISwitch!
    @IBOutlet private var stepValueLabel: UILabel!
    @IBOutlet private var numberOfStepsLabel: UILabel!
    @IBOutlet private var numberOfStepsStepper: UIStepper!
    @IBOutlet private var currentStepLabel: UILabel!
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        bind()
        subscribe()
    }
    
    private func bind() {
        slider.rx.value
            .map { "\($0)" }
            .bind(to: valueLabel.rx.text)
            .disposed(by: disposeBag)
        
        slider.rx.stepValue
            .map { "\($0)" }
            .bind(to: stepValueLabel.rx.text)
            .disposed(by: disposeBag)
        
        slider.rx.useHapticFeedback
            .bind(to: useHapticFeedbackSwitch.rx.isOn)
            .disposed(by: disposeBag)
        
        slider.rx.currentStepIndex
            .map { "\($0)" }
            .bind(to: currentStepLabel.rx.text)
            .disposed(by: disposeBag)
        
        numberOfStepsStepper.rx.value
            .map { Int($0) }
            .bind(to: slider.rx.numberOfSteps)
            .disposed(by: disposeBag)
        
        useHapticFeedbackSwitch.rx.isOn
            .bind(to: slider.rx.useHapticFeedback)
            .disposed(by: disposeBag)
    }
    
    private func subscribe() {
        slider.rx.numberOfSteps
            .subscribe(onNext: { [weak self] steps in
                guard let self = self else { return }
                self.numberOfStepsStepper.value = Double(steps)
                self.numberOfStepsLabel.text = "\(steps)"
            })
            .disposed(by: disposeBag)
    }
}
