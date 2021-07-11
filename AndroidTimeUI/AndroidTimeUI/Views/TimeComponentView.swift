//
//  TimeComponentView.swift
//  AndroidTimeUI
//
//  Created by Rohan Sharma on 7/10/21.
//  
//

import UIKit

public final class TimeComponentView: UIView {
    public  let containerView: UIView = {
        let v = UIView()
        v.clipsToBounds = true
        v.layer.cornerRadius = 20
        return v
    }()

    public lazy var blurredViewVStack: UIStackView = {
        let v = UIStackView(
            .vertical,
            arrangedSubviews: [topBlurredView, bottomBlurredView]
        )
        v.distribution = .fillEqually
        v.alignment = .fill
        v.spacing = 5
        return v
    }()

    private let centerView: UIView = {
        let v = UIView()
        return v
    }()

    public let topBlurredView: UIVisualEffectView = {
        let v = UIVisualEffectView(
            effect: UIBlurEffect(
                style: .light
            )
        )
        return v
    }()

    public let bottomBlurredView: UIVisualEffectView = {
        let v = UIVisualEffectView(
            effect: UIBlurEffect(
                style: .light
            )
        )
        return v
    }()

    public let anteMeridiemLabel: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.textAlignment = .right
        l.adjustsFontSizeToFitWidth = true
        l.minimumScaleFactor = 0.1
        return l
    }()

    public lazy var timeLabelHStack: UIStackView = {
        let v = UIStackView(arrangedSubviews: [timeLabel1, timeLabel2])
        v.alignment = .fill
        v.distribution = .equalCentering
        return v
    }()

    public let timeLabel1: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.font = UIFont.systemFont(ofSize: 100)
        l.textAlignment = .center
        l.adjustsFontSizeToFitWidth = true
        l.minimumScaleFactor = 0.1
        l.numberOfLines = 0
        return l
    }()

    public let timeLabel2: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.font = UIFont.systemFont(ofSize: 100)
        l.textAlignment = .center
        l.adjustsFontSizeToFitWidth = true
        l.minimumScaleFactor = 0.1
        l.numberOfLines = 0
        return l
    }()

    private let centerDividerColor: UIColor

    public init(centerDividerColor: UIColor) {
        self.centerDividerColor = centerDividerColor
        super.init(frame: .zero)
        setup()
    }

    public required init?(coder: NSCoder) {
        assertionFailure(Constants.Text.noStoryboards)
        return nil
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        if timeLabel1.font.pointSize != .zero {
            anteMeridiemLabel.font = UIFont.systemFont(
                ofSize: timeLabel1.font.pointSize * 0.1
            )
        }
    }

    private func setup() {
        addViews()
        setupConstraints()
        startAnteMeridiemAnimation()
    }

    private func addViews() {
        add(subviews: [containerView])
        containerView.add(
            subviews: [
                blurredViewVStack, anteMeridiemLabel, timeLabelHStack, centerView
            ]
        )
        centerView.backgroundColor = centerDividerColor
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.top.constraint(equalTo: top),
            containerView.leading.constraint(equalTo: leading),
            containerView.trailing.constraint(equalTo: trailing),
            containerView.bottom.constraint(equalTo: bottom),

            blurredViewVStack.top.constraint(equalTo: containerView.top),
            blurredViewVStack.leading.constraint(equalTo: containerView.leading),
            blurredViewVStack.trailing.constraint(equalTo: containerView.trailing),
            blurredViewVStack.bottom.constraint(equalTo: containerView.bottom),

            centerView.leading.constraint(equalTo: containerView.leading),
            centerView.trailing.constraint(equalTo: containerView.trailing),
            centerView.height.constraint(equalToConstant: 5),
            centerView.centerY.constraint(equalTo: containerView.centerY),

            timeLabelHStack.top.constraint(equalTo: containerView.top),
            timeLabelHStack.leading.constraint(equalTo: anteMeridiemLabel.trailing),
            timeLabelHStack.trailing.constraint(equalTo: containerView.trailing, constant: -5),
            timeLabelHStack.bottom.constraint(equalTo: containerView.bottom),

            anteMeridiemLabel.leading.constraint(equalTo: containerView.leading, constant: 5),
            anteMeridiemLabel.bottom.constraint(
                equalTo: containerView.bottom,
                constant: -15
            ),
            anteMeridiemLabel.height.constraint(equalTo: timeLabelHStack.height, multiplier: 0.15)
        ])
    }

    private func startAnteMeridiemAnimation() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 3
        flash.fromValue = 1
        flash.toValue = 0
        flash.timingFunction = CAMediaTimingFunction(
            name: CAMediaTimingFunctionName.easeInEaseOut
        )
        flash.autoreverses = true
        flash.repeatCount = .greatestFiniteMagnitude

        anteMeridiemLabel.layer.add(flash, forKey: nil)
    }

    public func configure(
        time1: String,
        time2: String,
        anteMeridiem: String? = nil
    ) {
        timeLabel1.text = time1
        timeLabel2.text = time2
        anteMeridiemLabel.text = anteMeridiem
        anteMeridiemLabel.isHidden = anteMeridiem == nil
    }
}
