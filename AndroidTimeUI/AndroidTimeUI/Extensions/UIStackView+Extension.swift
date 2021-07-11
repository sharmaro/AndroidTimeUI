//
//  UIStackView+Extension.swift
//  AndroidTimeUI
//
//  Created by Rohan Sharma on 7/10/21.
//

import UIKit

extension UIStackView {
    convenience init(
        _ axis: NSLayoutConstraint.Axis = .horizontal,
        arrangedSubviews: [UIView]
    ) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
    }
}
