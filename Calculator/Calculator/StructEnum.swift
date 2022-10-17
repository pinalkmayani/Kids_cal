//
//  StructEnum.swift
//  Calculator
//
//  Created by Pinal on 12/07/2022.
//

import Foundation
import CoreText

enum Operator: String
{
    case Times = "*"
    case Divide = "/"
    case Add = "+"
    case Minus = "-"
    case Nothing = ""
}

enum calculationState: String{
    case enterinNum = "enterinNum"
    case newNumStarted = "newNumStarted"
}
