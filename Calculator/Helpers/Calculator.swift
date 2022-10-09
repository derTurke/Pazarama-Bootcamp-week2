//
//  Calculator.swift
//  Calculator
//
//  Created by GÜRHAN YUVARLAK on 2.10.2022.
//

import Foundation

struct Calculator {
    
    private var number: Double?
    
    private var calculationTuple: (number1: Double, calcMethod: String)?
    
    // Prepare number
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    // Prepare calculation block
    mutating func calculate(calculateMethod: String) -> Double? {
        if let number {
            if calculateMethod == "+/-" {
                return number * -1
            } else if calculateMethod == "AC" {
                return 0.0
            } else if calculateMethod == "%" {
                return number * 0.01
            } else if calculateMethod == "=" {
                return calculation(number2: number)
            } else {
                calculationTuple = (number1: number, calcMethod: calculateMethod)
            }
        }
        return nil
    }
    
    // Calculaion Result
    private func calculation(number2: Double) -> Double? {
        if let number1 = calculationTuple?.number1, let operation = calculationTuple?.calcMethod {
            switch operation {
                case "+":
                    return number1 + number2
                case "-":
                    return number1 - number2
                case "x":
                    return number1 * number2
                case "÷":
                    return number1 / number2
                case "1/x":
                    return 1 / number1
                case "x²":
                    return number1 * number1
                case "²√":
                    return sqrt(number1)
                default:
                    break;
            }
        }
        return nil
    }
}
