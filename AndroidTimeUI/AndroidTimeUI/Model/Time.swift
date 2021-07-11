//
//  Time.swift
//  AndroidTimeUI
//
//  Created by Rohan Sharma on 7/10/21.
//  
//

import Foundation

public struct Time: Comparable {
    private enum Component {
        case hours
        case minutes
        case seconds
    }

    public enum AnteMeridiem {
        case am
        case pm
    }

    public var h1: String // hour 1
    public var h2: String // hour 2
    public var m1: String // minute 1
    public var m2: String // minute 2
    public var s1: String // second 1
    public var s2: String // second 2

    public var amSymbol = "AM"
    public var pmSymbol = "PM"

    public var anteMeridiemText: String {
        switch anteMeridiem {
        case .am:
            return amSymbol
        case .pm:
            return pmSymbol
        }
    }

    public private(set) var anteMeridiem: AnteMeridiem
    private var hoursComponents = ""
    private var minutesComponents = ""
    private var secondsComponents = ""

    /// Initializer with date object
    /// - Parameter date: date to create time object from
    public init(date: Date) {
        let date = Date()
        let calendar = Calendar.current

        var anteMeridiem = AnteMeridiem.am
        var hour = calendar.component(.hour, from: date)
        if hour > 12 {
            hour -= 12
            anteMeridiem = .pm
        }
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        let timeString = "\(hour):\(minutes):\(seconds)"
        self.init(timeString: timeString, anteMeridiem: anteMeridiem)
    }

    /// Initializer with string object
    /// - Parameter timeString: string to create time object out of
    /// - Can have format hh:mm
    /// - Or any variation: h:m, hh:m, h:mm
    /// - Seconds are optional
    public init(timeString: String, anteMeridiem: AnteMeridiem) {
        self.h1 = ""
        self.h2 = ""
        self.m1 = ""
        self.m2 = ""
        self.s1 = ""
        self.s2 = ""

        self.anteMeridiem = anteMeridiem

        guard isValid(timeString) else {
            return
        }

        setupTime()
    }

    public static func < (lhs: Time, rhs: Time) -> Bool {
        if lhs.h1 < rhs.h1 {
            return true
        } else if lhs.h2 < rhs.h2 {
            return true
        } else if lhs.m1 < rhs.m1 {
            return true
        } else if lhs.m2 < rhs.m2 {
            return true
        } else if lhs.s1 < rhs.s1 {
            return true
        } else if lhs.s2 < rhs.s2 {
            return true
        }
        return false
    }

    private mutating func isValid(_ timeString: String) -> Bool {
        let timeComponents = timeString.components(
            separatedBy: Constants.Text.colon
        )

        guard Constants.Range.acceptableTimeRange.contains(
                timeComponents.count
        ) else {
            assertionFailure(Constants.Text.timeComponentsError)
            return false
        }

        let hoursComponents = timeComponents[0]
        let minutesComponents = timeComponents[1]
        var secondsComponents = ""

        guard Constants.Range.acceptableComponentRange.contains(
            hoursComponents.count
        ),
        Constants.Range.acceptableComponentRange.contains(
            minutesComponents.count
        ) else {
            assertionFailure(Constants.Text.componentsCountError)
            return false
        }

        guard Int(hoursComponents) != nil,
              Int(minutesComponents) != nil else {
            assertionFailure(Constants.Text.componentsCountError)
            return false
        }

        if timeComponents.count == 3 {
            secondsComponents = timeComponents[2]
            guard Constants.Range.acceptableComponentRange.contains(
                secondsComponents.count
            ) else {
                assertionFailure(Constants.Text.componentsCountError)
                return false
            }

            guard Int(secondsComponents) != nil else {
                assertionFailure(Constants.Text.componentsCountError)
                return false
            }
        }

        self.hoursComponents = hoursComponents
        self.minutesComponents = minutesComponents
        self.secondsComponents = secondsComponents

        return true
    }

    private mutating func setupTime() {
        setupTimeComponents(componentsString: hoursComponents, component: .hours)
        setupTimeComponents(componentsString: minutesComponents, component: .minutes)
        setupTimeComponents(componentsString: secondsComponents, component: .seconds)
    }

    private mutating func setupTimeComponents(componentsString: String, component: Component) {
        if let firstComponent = componentsString.first {
            switch component {
            case .hours:
                h1 = "\(firstComponent)"
            case .minutes:
                m1 = "\(firstComponent)"
            case .seconds:
                s1 = "\(firstComponent)"
            }

            if componentsString.count == 2,
               let secondComponent = componentsString.last {
                switch component {
                case .hours:
                    h2 = "\(secondComponent)"
                case .minutes:
                    m2 = "\(secondComponent)"
                case .seconds:
                    s2 = "\(secondComponent)"
                }
            } else {
                switch component {
                case .hours:
                    h1 = "0"
                    h2 = "\(firstComponent)"
                case .minutes:
                    m1 = "\(firstComponent)"
                    m2 = "0"
                case .seconds:
                    s1 = "\(firstComponent)"
                    s2 = "0"
                }
            }
        }
    }
}
