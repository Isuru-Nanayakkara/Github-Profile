//
//  GithubAPIProvider.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-11.
//

import Foundation

protocol GithubAPIProvider: AnyObject {
    func fetchProfile(for username: String, pinned: Int, top: Int, starred: Int, _ completion: @escaping (Result<Profile, Error>) -> ())
}
