//
//  MockData.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-10.
//

import Foundation

struct MockData {
    static func user() -> Profile {
        return Profile(avatar: "placeholder_avatar", name: "Isuru Nanayakkara", username: "Isuru-Nanayakkara", email: "isuru.nan@gmail.com", followers: 41, following: 0, pinnedRepos: pinnedRepos(), topRepos: topRepos(), starredRepos: starredRepos())
    }
    
    static func pinnedRepos() -> [Repository] {
        return [
            Repository(ownerAvatar: "placeholder_avatar", ownerName: "Isuru-Nanayakkara", name: "ActivityIndicatorOverlayView", description: "An overlay view with a customizable activity indicator.", stars: 0, langauge: "Swift", languageColor: "ffac45"),
            Repository(ownerAvatar: "placeholder_avatar",ownerName: "Isuru-Nanayakkara", name: "InstagramAuthViewController", description: "A UIViewController subclass for Instagram authentication.", stars: 37, langauge: "Swift", languageColor: "ffac45"),
            Repository(ownerAvatar: "placeholder_avatar",ownerName: "Isuru-Nanayakkara", name: "Reach", description: "A simple class to check for internet connection availability in Swift.", stars: 454, langauge: "Swift", languageColor: "ffac45"),
        ]
    }
    
    static func topRepos() -> [Repository] {
        return [
            Repository(ownerAvatar: "placeholder_avatar",ownerName: "Isuru-Nanayakkara", name: "IJProgressView", description: "A simple progress view written in Swift.", stars: 71, langauge: "Swift", languageColor: "ffac45"),
            Repository(ownerAvatar: "placeholder_avatar",ownerName: "Isuru-Nanayakkara", name: "Reach", description: "A simple class to check for internet connection availability in Swift.", stars: 454, langauge: "Swift", languageColor: "ffac45"),
            Repository(ownerAvatar: "placeholder_avatar",ownerName: "Isuru-Nanayakkara", name: "My-Xcode-Snippets", description: "A set of Swift code I find myself typing over and over so thought of compiling them in to a repo so I'll have access to them from anywhere. Nothing fancy. I hope someone might find them useful too.", stars: 1, langauge: "Swift", languageColor: "ffac45"),
        ]
    }
    
    static func starredRepos() -> [Repository] {
        return [
            Repository(ownerAvatar: "placeholder_avatar",ownerName: "romaonthego", name: "RESideMenu", description: "iOS 7/8 style side menu with parallax effect.", stars: 7201, langauge: "Objective-C", languageColor: "438eff"),
            Repository(ownerAvatar: "placeholder_avatar",ownerName: "vpdn", name: "MMAppSwitcher", description: "Replace iOS7 app switcher view with your own customized card view.", stars: 1076, langauge: "Objective-C", languageColor: "438eff"),
            Repository(ownerAvatar: "placeholder_avatar",ownerName: "highlightjs", name: "highlight.js", description: "JavaScript syntax highlighter with language auto-detection and zero dependencies.", stars: 18511, langauge: "JavaScript", languageColor: "f1e05a"),
        ]
    }
}
