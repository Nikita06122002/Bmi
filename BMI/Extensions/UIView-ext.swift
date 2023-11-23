//
//  UIView-ext.swift
//  BMI
//
//  Created by macbook on 11.11.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        }
    }
}

