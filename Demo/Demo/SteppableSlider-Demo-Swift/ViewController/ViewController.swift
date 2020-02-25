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
    @IBOutlet private var useStepSwitch: UISwitch!
    @IBOutlet private var useHapticFeedbackSwitch: UISwitch!
    @IBOutlet private var expandThumbRectSwitch: UISwitch!
    
    private var sliderStep: Int = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        initLayout()
    }
    
    private func initLayout() {
        useStepSwitch.isOn = slider.useStep
        useHapticFeedbackSwitch.isOn = slider.useHapticFeedback
        expandThumbRectSwitch.isOn = slider.expandThumbRectToEdges
    }
    
    private func updateValueLabel() {
        valueLabel.text = "\(slider.value)"
    }
    
    @IBAction private func sliderValueChanged(_ sender: UISlider) {
        updateValueLabel()
    }
    
    @IBAction private func switchValueChanged(_ sender: UISwitch) {
        if sender == useStepSwitch {
            slider.useStep = sender.isOn
        } else if sender == useHapticFeedbackSwitch {
            slider.useHapticFeedback = sender.isOn
        } else if sender == expandThumbRectSwitch {
            slider.expandThumbRectToEdges = sender.isOn
        }
        
        slider.value = slider.maximumValue / 2
        updateValueLabel()
    }
}

extension ViewController: SteppableSliderDataSource {
    func numberOfSteps(in slider: SteppableSlider) -> Int {
        return sliderStep
    }
    
    func viewForSteps(in slider: SteppableSlider) -> UIView? {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 2).isActive = true
        view.heightAnchor.constraint(equalToConstant: 11).isActive = true
        return view
    }
}
