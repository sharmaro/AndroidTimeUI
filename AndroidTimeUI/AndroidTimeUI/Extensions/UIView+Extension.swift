//
//  UIView+Extension.swift
//  AndroidTimeUI
//
//  Created by Rohan Sharma on 7/10/21.
//

import UIKit

public extension UIView {
    // Safe area constraints
    var safeTop: NSLayoutYAxisAnchor {
        safeAreaLayoutGuide.topAnchor
    }

    var safeLeading: NSLayoutXAxisAnchor {
        safeAreaLayoutGuide.leadingAnchor
    }

    var safeTrailing: NSLayoutXAxisAnchor {
        safeAreaLayoutGuide.trailingAnchor
    }

    var safeBottom: NSLayoutYAxisAnchor {
        safeAreaLayoutGuide.bottomAnchor
    }

    // Constraints
    var top: NSLayoutYAxisAnchor {
        topAnchor
    }

    var leading: NSLayoutXAxisAnchor {
        leadingAnchor
    }

    var trailing: NSLayoutXAxisAnchor {
        trailingAnchor
    }

    var bottom: NSLayoutYAxisAnchor {
        bottomAnchor
    }

    var centerX: NSLayoutXAxisAnchor {
        centerXAnchor
    }

    var centerY: NSLayoutYAxisAnchor {
        centerYAnchor
    }

    var height: NSLayoutDimension {
        heightAnchor
    }

    var width: NSLayoutDimension {
        widthAnchor
    }

    func add(subviews: [UIView]) {
        subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
}
