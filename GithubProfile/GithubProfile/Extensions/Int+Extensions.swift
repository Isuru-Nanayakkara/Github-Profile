//
//  Int+Extensions.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-10.
//

import Foundation

// Source: https://gist.github.com/gbitaudeau/daa4d6dc46517b450965e9c7e13706a3
extension Int {
    func formatUsingAbbrevation () -> String {
        typealias Abbrevation = (threshold: Double, divisor: Double, suffix: String)
        
        let abbreviations: [Abbrevation] = [
            (0, 1, ""),
            (1000.0, 1000.0, "K"),
            (100_000.0, 1_000_000.0, "M"),
            (100_000_000.0, 1_000_000_000.0, "B")
        ]
        
        let startValue = Double (abs(self))
        let abbreviation: Abbrevation = {
            var prevAbbreviation = abbreviations[0]
            for tmpAbbreviation in abbreviations {
                if (startValue < tmpAbbreviation.threshold) {
                    break
                }
                prevAbbreviation = tmpAbbreviation
            }
            return prevAbbreviation
        }()
        
        let value = Double(self) / abbreviation.divisor
        
        let formatter = NumberFormatter()
        formatter.positiveSuffix = abbreviation.suffix
        formatter.negativeSuffix = abbreviation.suffix
        formatter.allowsFloats = true
        formatter.minimumIntegerDigits = 1
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
        
        return formatter.string(from: NSNumber(value: value))!
    }
}
