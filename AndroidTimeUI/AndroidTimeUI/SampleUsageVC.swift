//
//  SampleUsageVC.swift
//  AndroidTimeUI
//
//  Created by Rohan Sharma on 7/10/21.
//

import UIKit

public final class SampleUsageVC: UIViewController {
    private let glassTimeView: GlassTimeView = {
        let v = GlassTimeView(
            time: .init(date: .init()),
            centerDividerColor: .darkGray
        )
        return v
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray

        view.add(subviews: [glassTimeView])

        NSLayoutConstraint.activate([
            glassTimeView.safeLeading.constraint(greaterThanOrEqualTo: view.safeLeading, constant: 20),
            glassTimeView.safeTrailing.constraint(lessThanOrEqualTo: view.safeTrailing, constant: -20),
            glassTimeView.centerX.constraint(equalTo: view.centerX),
            glassTimeView.centerY.constraint(equalTo: view.centerY),
            glassTimeView.height.constraint(equalToConstant: 100)
        ])

        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            self?.glassTimeView.updateTime(time: .init(date: .init()))
        }
    }
}
