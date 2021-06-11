//
//  AssetsFactory.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-11.
//

import UIKit

struct AssetsFactory {
    static var startIcon: UIImage? {
        if #available(iOS 13.0, *) {
            return UIImage(systemName: "star.fill")
        } else {
            return UIImage(named: "star")
        }
    }
    
    static var circleIcon: UIImage? {
        if #available(iOS 13.0, *) {
            return UIImage(systemName: "circle.fill")
        } else {
            return UIImage(named: "circle")
        }
    }
}
