//
//  ViewController.swift
//  Calculator
//
//  Created by GÜRHAN YUVARLAK on 29.09.2022.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var displayCalculation: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    
    // Convert string value to double value
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
            //displayCalculation.text = String(newValue)
        }
    }
    
    // Helpers -> Calculator Struct
    private var calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel.text = ""
    }
    
    // Tapped number button function
    @IBAction func didTapDigitButton(_ sender: UIButton) {
        if let number = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = number
                displayCalculation.text! += number
                isFinishedTypingNumber = false
            } else {
                if number == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text! += number
                displayCalculation.text! += number
            }
        }
    }
    
    // Tapped calculation button function
    @IBAction func didTapCalcButton(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "AC" {
                displayCalculation.text = ""
            } else if calcMethod == "+/-" {
                let doubleNum = (Double(displayCalculation.text ?? "") ?? 0) * -1
                displayCalculation.text = String(doubleNum)
            } else if calcMethod == "%" {
                let doubleNum = (Double(displayCalculation.text ?? "") ?? 0) * 0.01
                displayCalculation.text = String(doubleNum)
            } else {
                displayCalculation.text! += String(calcMethod)
            }
            if let result = calculator.calculate(calculateMethod: calcMethod) {
                displayValue = result
                
            }
        }
    }
    
    
    
}

