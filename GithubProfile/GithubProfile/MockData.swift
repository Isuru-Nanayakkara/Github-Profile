//
//  MockData.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-10.
//

import Foundation

struct Profile {
    let name: String
    let username: String
    let email: String
    let followers: Int
    let following: Int
}

struct Repository {
    let ownerName: String
    let name: String
    let description: String?
    let stars: Int
    let langauge: String
}

struct MockData {
    static func user() -> Profile {
        return Profile(name: "Isuru Nanayakkara", username: "Isuru-Nanayakkara", email: "isuru.nan@gmail.com", followers: 41, following: 0)
    }
    
    static func pinnedRepos() -> [Repository] {
        return [
            Repository(ownerName: "Isuru-Nanayakkara", name: "ActivityIndicatorOverlayView", description: nil, stars: 0, langauge: "Swift"),
            Repository(ownerName: "Isuru-Nanayakkara", name: "InstagramAuthViewController", description: "A ViewController for Instagram authentication.", stars: 37, langauge: "Swift"),
            Repository(ownerName: "Isuru-Nanayakkara", name: "Reach", description: "A simple class to check for internet connection availability in Swift.", stars: 454, langauge: "Swift"),
        ]
    }
    
    static func topRepos() -> [Repository] {
        return [
            Repository(ownerName: "Isuru-Nanayakkara", name: "IJProgressView", description: "A simple progress view written in Swift.", stars: 71, langauge: "Swift"),
            Repository(ownerName: "Isuru-Nanayakkara", name: "Reach", description: "A simple class to check for internet connection availability in Swift.", stars: 454, langauge: "Swift"),
            Repository(ownerName: "Isuru-Nanayakkara", name: "My-Xcode-Snippets", description: "A set of Swift code I find myself typing over and over so thought of compiling them in to a repo so I'll have access to them from anywhere. Nothing fancy. I hope someone might find them useful too.", stars: 1, langauge: "Swift"),
        ]
    }
    
    static func starredRepos() -> [Repository] {
        return [
            Repository(ownerName: "romaonthego", name: "RESideMenu", description: "iOS 7/8 style side menu with parallax effect.", stars: 7201, langauge: "Objective-C"),
            Repository(ownerName: "vpdn", name: "MMAppSwitcher", description: "Replace iOS7 app switcher view with your own customized card view.", stars: 1076, langauge: "Objective-C"),
            Repository(ownerName: "highlightjs", name: "highlight.js", description: "JavaScript syntax highlighter with language auto-detection and zero dependencies.", stars: 18511, langauge: "JavaScript"),
        ]
    }
}
