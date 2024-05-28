//
//  StructsEnum.swift
//  calculator
//
//  Created by Marat on 2024-05-26.
//

import Foundation

enum Operator: String
{
    case add = "+"
    case subtract = "-"
    case times = "*"
    case divide = "/"
    case nothing = ""
}

enum CalculationState: String
{
    case enteringNum = "enteringNum"
    case newNumStarted = "newNumStarted"
    
}
