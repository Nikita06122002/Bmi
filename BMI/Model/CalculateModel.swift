//
//  CalculateModel.swift
//  BMI
//
//  Created by macbook on 19.11.2023.
//

import UIKit

struct CalculateModel {

    var bmi: BMI?
    
    mutating func getBMI() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let BMIValue = weight / pow(height, 2)
        switch BMIValue {
        case 0..<19:
            bmi = BMI(value: BMIValue, advice: "Недовес!", color: .blue)
        case 19..<27:
            bmi = BMI(value: BMIValue, advice: "Вы здоровы, ожирения нет!", color: .green)
        case 27... :
            bmi = BMI(value: BMIValue, advice: "У вас ожирение!", color: .red)
        default:
            break
        }
    }
}
