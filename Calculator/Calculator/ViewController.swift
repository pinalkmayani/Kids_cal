//
//  ViewController.swift
//  Calculator
//
//  Created by Pinal on 08/07/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    var currentOperator: Operator = Operator.Nothing
    var calcState: calculationState = calculationState.enterinNum
    var firstvalue: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func numberClicked(_sender: UIButton)
    {
        
        updateDisplay(number: String(_sender.tag))
        
    }
    func updateDisplay(number: String)
    {
        if calcState == calculationState.newNumStarted
        {
            if let num = resultLabel.text
            {
                if num != ""
                {
                    firstvalue = num
                }
            }
            calcState = calculationState.enterinNum
            resultLabel.text = number
        }
        else if calcState == calculationState.enterinNum
        {
            resultLabel.text = resultLabel.text! + number
        }
    }
    @IBAction func operatorClicked(_sender: UIButton)
    {
        calcState = calculationState.newNumStarted
        if let num = resultLabel.text{
            if num != ""
            {
                firstvalue = num
                resultLabel.text = ""
            }
        }
        upadateOperatorButton(tag: _sender.tag)
        
        switch _sender.tag {
        case 10:
            currentOperator = Operator.Times
        case 11:
            currentOperator = Operator.Divide
        case 12:
            currentOperator = Operator.Add
        case 13:
            currentOperator = Operator.Minus
            
        default :
            return
        }
    }
    @IBAction func equalsClicked(_sender: UIButton)
    {
        calculatSum()
    }
    func calculatSum()
    {
        if(firstvalue.isEmpty)
        {
            return
        }
        var result = ""
        if currentOperator == Operator.Times
        {
            result = "\(Double(firstvalue)! * Double(resultLabel.text!)!)"
            
        }
        else if currentOperator == Operator.Divide
        {
            result = "\(Double(firstvalue)! / Double(resultLabel.text!)!)"
        }
        else if currentOperator == Operator.Add
        {
            result = "\(Double(firstvalue)! + Double(resultLabel.text!)!)"
        }
        else if currentOperator == Operator.Minus
        {
            result = "\(Double(firstvalue)! - Double(resultLabel.text!)!)"
        }
        resultLabel.text = result
        calcState = calculationState.newNumStarted
        
    }
    func upadateOperatorButton(tag : Int)
    {
        for i in 10..<14
        {
            if let button = self.view.viewWithTag(i) as? UIButton {
                button.backgroundColor = UIColor.clear
            }
        }
        if let button = self.view.viewWithTag(tag) as? UIButton{
            button.backgroundColor = UIColor.yellow
        }
    }
}

