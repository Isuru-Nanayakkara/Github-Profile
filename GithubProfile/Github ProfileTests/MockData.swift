//
//  MockData.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-10.
//

import Foundation
@testable import Github_Profile

struct MockData {
    static func user() -> Profile {
        return Profile(avatar: "placeholder_avatar", name: "Isuru Nanayakkara", username: "Isuru-Nanayakkara", email: "isuru.nan@gmail.com", followers: 41, following: 0, pinnedRepos: pinnedRepos(), topRepos: topRepos(), starredRepos: starredRepos())
    }
    
    static func pinnedRepos() -> [Repository] {
        return [
            Repository(ownerAvatar: "placeholder_avatar", ownerName: "Isuru-Nanayakkara", name: "Test Repo Name", description: "This is a fake repo to to test.", stars: 42, langauge: "Swift", languageColor: "ffac45"),
            Repository(ownerAvatar: "placeholder_avatar", ownerName: "Isuru-Nanayakkara", name: "Test Repo Name", description: "This is a fake repo to to test.", stars: 0, langauge: "Swift", languageColor: "ffac45"),
            Repository(ownerAvatar: "placeholder_avatar", ownerName: "Isuru-Nanayakkara", name: "Test Repo Name", description: nil, stars: 42, langauge: "Swift", languageColor: "ffac45"),
        ]
    }
    
    static func topRepos() -> [Repository] {
        return [
            Repository(ownerAvatar: "placeholder_avatar", ownerName: "Isuru-Nanayakkara", name: "Test Repo Name", description: "This is a fake repo to to test.", stars: 42, langauge: "Swift", languageColor: "ffac45"),
            Repository(ownerAvatar: "placeholder_avatar", ownerName: "Isuru-Nanayakkara", name: "Test Repo Name", description: "This is a fake repo to to test.", stars: 0, langauge: "Swift", languageColor: "ffac45"),
            Repository(ownerAvatar: "placeholder_avatar", ownerName: "Isuru-Nanayakkara", name: "Test Repo Name", description: nil, stars: 42, langauge: "Swift", languageColor: "ffac45"),
            Repository(ownerAvatar: "placeholder_avatar", ownerName: "Isuru-Nanayakkara", name: "Test Repo Name", description: "This is a fake repo to to test.", stars: 42, langauge: "Swift", languageColor: "ffac45"),
            Repository(ownerAvatar: "placeholder_avatar", ownerName: "Isuru-Nanayakkara", name: "Test Repo Name", description: "This is a fake repo to to test.", stars: 0, langauge: "Swift", languageColor: "ffac45"),
            Repository(ownerAvatar: "placeholder_avatar", ownerName: "Isuru-Nanayakkara", name: "Test Repo Name", description: nil, stars: 42, langauge: "Swift", languageColor: "ffac45"),
            Repository(ownerAvatar: "placeholder_avatar", ownerName: "Isuru-Nanayakkara", name: "Test Repo Name", description: "This is a fake repo to to test.", stars: 42, langauge: "Swift", languageColor: "ffac45"),
            Repository(ownerAvatar: "placeholder_avatar", ownerName: "Isuru-Nanayakkara", name: "Test Repo Name", description: "This is a fake repo to to test.", stars: 0, langauge: "Swift", languageColor: "ffac45"),
            Repository(ownerAvatar: "placeholder_avatar", ownerName: "Isuru-Nanayakkara", name: "Test Repo Name", description: nil, stars: 42, langauge: "Swift", languageColor: "ffac45"),
            Repository(ownerAvatar: "placeholder_avatar", ownerName: "Isuru-Nanayakkara", name: "Test Repo Name", description: "This is a fake repo to to test.", stars: 42, langauge: "Swift", languageColor: "ffac45"),
        ]
    }
    
    static func starredRepos() -> [Repository] {
        return [
            Repository(ownerAvatar: "placeholder_avatar", ownerName: "Isuru-Nanayakkara", name: "Test Repo Name", description: "This is a fake repo to to test.", stars: 42, langauge: "Swift", languageColor: "ffac45"),
            Repository(ownerAvatar: "placeholder_avatar", ownerName: "Isuru-Nanayakkara", name: "Test Repo Name", description: "This is a fake repo to to test.", stars: 0, langauge: "Swift", languageColor: "ffac45"),
            Repository(ownerAvatar: "placeholder_avatar", ownerName: "Isuru-Nanayakkara", name: "Test Repo Name", description: nil, stars: 42, langauge: "Swift", languageColor: "ffac45"),
            Repository(ownerAvatar: "placeholder_avatar", ownerName: "Isuru-Nanayakkara", name: "Test Repo Name", description: "This is a fake repo to to test.", stars: 42, langauge: "Swift", languageColor: "ffac45"),
            Repository(ownerAvatar: "placeholder_avatar", ownerName: "Isuru-Nanayakkara", name: "Test Repo Name", description: "This is a fake repo to to test.", stars: 0, langauge: "Swift", languageColor: "ffac45"),
            Repository(ownerAvatar: "placeholder_avatar", ownerName: "Isuru-Nanayakkara", name: "Test Repo Name", description: nil, stars: 42, langauge: "Swift", languageColor: "ffac45"),
            Repository(ownerAvatar: "placeholder_avatar", ownerName: "Isuru-Nanayakkara", name: "Test Repo Name", description: "This is a fake repo to to test.", stars: 42, langauge: "Swift", languageColor: "ffac45"),
            Repository(ownerAvatar: "placeholder_avatar", ownerName: "Isuru-Nanayakkara", name: "Test Repo Name", description: "This is a fake repo to to test.", stars: 0, langauge: "Swift", languageColor: "ffac45"),
            Repository(ownerAvatar: "placeholder_avatar", ownerName: "Isuru-Nanayakkara", name: "Test Repo Name", description: nil, stars: 42, langauge: "Swift", languageColor: "ffac45"),
            Repository(ownerAvatar: "placeholder_avatar", ownerName: "Isuru-Nanayakkara", name: "Test Repo Name", description: "This is a fake repo to to test.", stars: 42, langauge: "Swift", languageColor: "ffac45"),
        ]
    }
}
