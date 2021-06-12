//
//  CacheMocks.swift
//  Github ProfileTests
//
//  Created by Isuru Nanayakkara on 2021-06-12.
//

import XCTest
@testable import Github_Profile

class MockCache: CacheProvider {
    func saveProfile(_ profile: Profile) throws {
        
    }
    
    func fetchProfile() throws -> Profile? {
        return nil
    }
}
