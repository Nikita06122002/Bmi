//
//  UISlider-ext.swift
//  BMI
//
//  Created by macbook on 19.11.2023.
//

import UIKit

extension UISlider {
    
    convenience init(min: Float? = nil, max: Float? = nil) {
        self.init(frame: .infinite)
        if let min = min {
            self.maximumValue = min
        }
        if let max = max {
            self.maximumValue = max
        }
    }
}
