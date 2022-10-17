//
//  StructsEnums.swift
//  Calculator
//
//  Created by Grant on 12/07/2016.
//  Copyright © 2016 GK MIcro Ltd. All rights reserved.
//

import Foundation

enum Operator: String {
    case add = "+"
    case subtract = "-"
    case times = "*"
    case divide = "/"
    case nothing = ""
}

enum CalculationState: String {
    case enteringNum = "enteringNum"
    case newNumStarted = "newNumStarted"
}
