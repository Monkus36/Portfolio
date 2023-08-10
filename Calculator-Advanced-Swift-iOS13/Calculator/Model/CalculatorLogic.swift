//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Cameron Mundorff on 6/17/23.
//

import Foundation

struct CalculatorLogic {
    
    // This is used to passed the displayValue from viewController to this class
    private var number : Double?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    //This is a tuple.
    private var intermediateCalculation: (calcMethod: String, n1: Double)?
    
    //Double is an optional? in case nil is returned
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            switch symbol{
            case "+/-": return n * -1
            case "AC": return 0
            case "%": return n * 0.01
            case "=": return performTwoNumCalculation(n2: n)
            default:
                intermediateCalculation = (calcMethod: symbol, n1: n)
            }
            
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            
            switch(operation){
            case "+": return n1 + n2
            case "-": return n1 - n2
            case "×": return n1 * n2
            case "÷": return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
}
