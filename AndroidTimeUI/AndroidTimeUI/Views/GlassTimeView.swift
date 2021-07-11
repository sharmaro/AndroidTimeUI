//
//  GlassTimeView.swift
//  AndroidTimeUI
//
//  Created by Rohan Sharma on 7/10/21.
//  
//

import UIKit

public final class GlassTimeView: UIView {
    public lazy var containerHStack: UIStackView = {
        let v = UIStackView(
            arrangedSubviews: [
                hoursComponentView, minutesComponentView, secondsComponentView
            ]
        )
        v.distribution = .fillEqually
        v.alignment = .center
        v.spacing = 15
        return v
    }()

    public lazy var hoursComponentView = createTimeComponentView(
        time1: "",
        time2: ""
    )

    public lazy var minutesComponentView = createTimeComponentView(
        time1: "",
        time2: ""
    )

    public lazy var secondsComponentView = createTimeComponentView(
        time1: "",
        time2: ""
    )

    private var time: Time
    private let showsSeconds: Bool
    private let showsAnteMeridiem: Bool
    private let centerDividerColor: UIColor

    public init(
        time: Time,
        showsSeconds: Bool = true,
        showsAnteMeridiem: Bool = true,
        centerDividerColor: UIColor = .clear
    ) {
        self.time = time
        self.showsSeconds = showsSeconds
        self.showsAnteMeridiem = showsAnteMeridiem
        self.centerDividerColor = centerDividerColor
        super.init(frame: .zero)
        setupHStack()
        configureTimeComponents()
    }

    public required init?(coder: NSCoder) {
        assertionFailure(Constants.Text.noStoryboards)
        return nil
    }

    private func setupHStack() {
        add(subviews: [containerHStack])

        NSLayoutConstraint.activate([
            containerHStack.top.constraint(equalTo: top),
            containerHStack.leading.constraint(equalTo: leading),
            containerHStack.trailing.constraint(equalTo: trailing),
            containerHStack.bottom.constraint(equalTo: bottom)
        ])
    }

    private func configureTimeComponents() {
        hoursComponentView.configure(
            time1: time.h1,
            time2: time.h2,
            anteMeridiem: showsAnteMeridiem ? time.anteMeridiemText : nil
        )

        minutesComponentView.configure(time1: time.m1, time2: time.m2)

        if showsSeconds {
            secondsComponentView.configure(time1: time.s1, time2: time.s2)
        }
    }

    private func createComponentsHStack() -> UIStackView {
        let v = UIStackView()
        v.distribution = .fillEqually
        v.alignment = .center
        v.spacing = 5
        return v
    }

    private func createTimeComponentView(
        time1: String,
        time2: String,
        anteMeridiem: String? = nil
    ) -> TimeComponentView {
        let v = TimeComponentView(centerDividerColor: centerDividerColor)
        v.configure(
            time1: time1,
            time2: time2,
            anteMeridiem: anteMeridiem
        )
        return v
    }

    public func updateTime(time: Time) {
        self.time = time
        configureTimeComponents()
    }
}
