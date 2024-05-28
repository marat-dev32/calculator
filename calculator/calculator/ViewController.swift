//
//  ViewController.swift
//  calculator
//
//  Created by Marat on 2024-05-26.
//

import UIKit

class ViewController: UIViewController {

    var currenstOperator: Operator = Operator.nothing
    var calState: CalculationState = CalculationState.enteringNum
    
    var firstValue: String = ""
    
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numberClicked(_ sender: UIButton)
    {
        updateDisplay (number: String(sender.tag))
    }
    
    func updateDisplay (number: String)
    {
        if calState == CalculationState.newNumStarted
        {
            if let num = resultLabel.text
            {
                if num != ""
                {
                    firstValue = num
                    
                }
            }
            
            calState = CalculationState.enteringNum
            resultLabel.text = number
            
        }
        
        else if calState == CalculationState.enteringNum
        {
            resultLabel.text = resultLabel.text! + number
        }
    }
    
    @IBAction func operatorClicked(_ sender: UIButton)
    {
        calState = CalculationState.newNumStarted
        if let num = resultLabel.text
        {
            if num != ""
            {
                firstValue = num
                resultLabel.text = ""
            }
        }
        
        switch sender.tag
        {
        case 10:
            currenstOperator = Operator.add
        case 11:
            currenstOperator = Operator.subtract
        case 12:
            currenstOperator = Operator.times
        case 13:
            currenstOperator = Operator.divide
        default:
            return
        }
    }
    
    @IBAction func equalClicked(_ sender: UIButton)
    {
        calculateSum()
    }
    func calculateSum ()
    {
        if (firstValue.isEmpty)
        {
            return
        }
        
        var result = ""
        
        if currenstOperator == Operator.times
        {
            result = "\(Double(firstValue)! * Double(resultLabel.text!)!)"
        }
        else if currenstOperator == Operator.divide
        {
            result = "\(Double(firstValue)! / Double(resultLabel.text!)!)"
        }
        else if currenstOperator == Operator.add
        {
            result = "\(Double(firstValue)! + Double(resultLabel.text!)!)"
        }
        else if currenstOperator == Operator.subtract
        {
            result = "\(Double(firstValue)! - Double(resultLabel.text!)!)"
        }
        
        resultLabel.text = result
        
        calState = CalculationState.newNumStarted
        
    }
    

    @IBAction func clearClicked(_ sender: Any)
    {
        resultLabel.text = ""
    }
    
}
