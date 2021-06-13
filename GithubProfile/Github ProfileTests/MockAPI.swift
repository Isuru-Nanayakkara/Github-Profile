//
//  APIMocks.swift
//  Github ProfileTests
//
//  Created by Isuru Nanayakkara on 2021-06-12.
//

import XCTest
@testable import Github_Profile

class MockAPI: GithubAPIProvider {
    func fetchProfile(for username: String, pinned: Int, top: Int, starred: Int, _ completion: @escaping (Result<Profile, Error>) -> ()) {
        let profile = MockData.user()
        completion(.success(profile))
    }
}
