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
