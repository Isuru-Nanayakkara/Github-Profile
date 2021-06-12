//
//  CacheProvider.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-11.
//

import Foundation

protocol CacheProvider: AnyObject {
    func saveProfile(_ profile: Profile) throws
    func fetchProfile() throws -> Profile?
}
