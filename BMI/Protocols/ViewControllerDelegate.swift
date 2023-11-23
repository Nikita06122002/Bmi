//
//  ViewControllerDelegate.swift
//  BMI
//
//  Created by macbook on 19.11.2023.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func getResult() -> Float
    func getColor() -> UIColor
    func getAdvice() -> String
}
