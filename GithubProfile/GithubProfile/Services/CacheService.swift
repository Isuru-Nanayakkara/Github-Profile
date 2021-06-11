//
//  CacheService.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-11.
//

import Foundation

struct CacheService {
    private var cache: Cache!
    
    init(cache: Cache) {
        self.cache = cache
    }
    
    func save(_ profile: Profile) {
        try? cache.saveProfile(profile)
    }
    
    func fetchProfile() -> Profile? {
        return try? cache.fetchProfile()
    }
}
