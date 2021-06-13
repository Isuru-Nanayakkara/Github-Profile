//
//  APIService.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-11.
//

import Foundation

class APIService {
    private var api: GithubAPIProvider!
    
    init(api: GithubAPIProvider) {
        self.api = api
    }
    
    func fetchProfile(for username: String, pinned: Int, top: Int, starred: Int, _ completion: @escaping (Result<Profile, Error>) -> ()) {
        api.fetchProfile(for: username, pinned: pinned, top: top, starred: starred, completion)
    }
}
