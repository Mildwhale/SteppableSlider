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
import SteppableSlider

final class ViewController: UIViewController {
    @IBOutlet private var slider: SteppableSlider!
    @IBOutlet private var valueLabel: UILabel!
    @IBOutlet private var useHapticFeedbackSwitch: UISwitch!
    @IBOutlet private var stepValueLabel: UILabel!
    @IBOutlet private var numberOfStepsLabel: UILabel!
    @IBOutlet private var numberOfStepsStepper: UIStepper!
    @IBOutlet private var currentStepLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        initLayout()
    }
    
    private func initLayout() {
        numberOfStepsStepper.value = Double(slider.numberOfSteps)
        useHapticFeedbackSwitch.isOn = slider.useHapticFeedback
        
        updateLabels()
    }
    
    private func updateLabels() {
        valueLabel.text = "\(slider.value)"
        stepValueLabel.text = "\(slider.stepValue)"
        numberOfStepsLabel.text = "\(slider.numberOfSteps)"
        currentStepLabel.text = "\(slider.currentStepIndex)"
    }
    
    @IBAction private func sliderValueChanged(_ sender: UISlider) {
        updateLabels()
    }
    
    @IBAction private func switchValueChanged(_ sender: UISwitch) {
        slider.useHapticFeedback = sender.isOn
    }
    
    @IBAction private func stepperValueChanged(_ sender: UIStepper) {
        slider.numberOfSteps = Int(numberOfStepsStepper.value)
        slider.value = 0
        updateLabels()
    }
}
