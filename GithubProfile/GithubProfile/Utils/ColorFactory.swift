//
//  ColorFactory.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-11.
//

import UIKit

struct ColorFactory {
    static var label: UIColor {
        if #available(iOS 13.0, *) {
            return .label
        } else {
            return .black
        }
    }
    
    static var secondaryLabel: UIColor {
        if #available(iOS 13.0, *) {
            return .secondaryLabel
        } else {
            return .darkGray
        }
    }
    
    static var systemBackground: UIColor {
        if #available(iOS 13.0, *) {
            return .systemBackground
        } else {
            return .white
        }
    }
    
    static var tertiarySystemBackground: UIColor {
        if #available(iOS 13.0, *) {
            return .tertiarySystemBackground
        } else {
            return .white
        }
    }
    
    static var systemGray4: UIColor {
        if #available(iOS 13.0, *) {
            return .systemGray4
        } else {
            return .lightGray.withAlphaComponent(0.5)
        }
    }
}
