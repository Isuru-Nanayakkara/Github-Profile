//
//  APIService.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-11.
//

import Foundation

class APIService {
    private var api: GithubAPI!
    
    init(api: GithubAPI) {
        self.api = api
    }
    
    func fetchProfile(_ completion: @escaping (Result<Profile, Error>) -> ()) {
        api.fetchProfile(completion)
    }
}
