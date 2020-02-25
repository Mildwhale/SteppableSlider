//
//  ViewController.swift
//  SteppableSliderDemo-Swift
//
//  Created by Kyujin Kim on 2020/02/25.
//  Copyright © 2020 Kyujin Kim. All rights reserved.
//

import UIKit
import SteppableSlider

final class ViewController: UIViewController {
    @IBOutlet private var slider: SteppableSlider!
    @IBOutlet private var valueLabel: UILabel!
    @IBOutlet private var useHapticFeedbackSwitch: UISwitch!
    @IBOutlet private var stepValueLabel: UILabel!
    @IBOutlet private var stepValueStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        initLayout()
    }
    
    private func initLayout() {
        stepValueLabel.text = "\(Int(slider.stepValue))"
        stepValueStepper.value = Double(slider.stepValue)
        useHapticFeedbackSwitch.isOn = slider.useHapticFeedback
    }
    
    private func updateValueLabel() {
        valueLabel.text = "\(slider.value)"
    }
    
    @IBAction private func sliderValueChanged(_ sender: UISlider) {
        updateValueLabel()
    }
    
    @IBAction private func switchValueChanged(_ sender: UISwitch) {
        if sender == useHapticFeedbackSwitch {
            slider.useHapticFeedback = sender.isOn
        }
        
        slider.value = slider.maximumValue / 2
        updateValueLabel()
    }
    
    @IBAction private func stepperValueChanged(_ sender: UIStepper) {
        stepValueLabel.text = "\(Int(sender.value))"
        slider.stepValue = Float(sender.value)
    }
}
