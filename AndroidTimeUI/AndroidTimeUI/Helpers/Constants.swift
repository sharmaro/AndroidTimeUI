//
//  Constants.swift
//  AndroidTimeUI
//
//  Created by Rohan Sharma on 7/10/21.
//  
//

import Foundation

public enum Constants {
    public enum Text {
        static let colon = ":"
        static let timeComponentsError =
            """
            Time string needs to be able to be split into two components.
            One for hours and one for minutes.
            """
        static let componentsCountError = "Time components count needs to be in the range: \(Range.acceptableComponentRange)."
        static let improperComponentsFormat = "Components are not numbers."
        static let noStoryboards = "No storyboards"
    }

    public enum Range {
        static let acceptableTimeRange = 2...3
        static let acceptableComponentRange = 1...2
    }
}
