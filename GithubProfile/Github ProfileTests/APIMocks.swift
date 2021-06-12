//
//  APIMocks.swift
//  Github ProfileTests
//
//  Created by Isuru Nanayakkara on 2021-06-12.
//

import XCTest
@testable import Github_Profile

class MockAPI: GithubAPI {
    func fetchProfile(_ completion: @escaping (Result<Profile, Error>) -> ()) {
        
    }
}
