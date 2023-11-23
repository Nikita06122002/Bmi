//
//  UIButton-ext.swift
//  BMI
//
//  Created by macbook on 19.11.2023.
//

import UIKit

extension UIButton {
    convenience init(backgroundColor: UIColor? = nil, title: String? = nil, titleColor: UIColor? = nil, cornerRadius: CGFloat? = nil) {
        self.init(frame: .infinite)
        if let color = backgroundColor {
            self.backgroundColor = color
        }
        if let title = title {
            self.setTitle(title, for: .normal)
        }
        if let titleColor = titleColor {
            self.setTitleColor(titleColor, for: .normal)
        }
        if let radius = cornerRadius {
            self.layer.cornerRadius = radius
        }
    }
}
