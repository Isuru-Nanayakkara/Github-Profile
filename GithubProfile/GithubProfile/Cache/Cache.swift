//
//  Cache.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-11.
//

import Foundation

protocol Cache: AnyObject {
    func saveProfile(_ profile: Profile) throws
    func fetchProfile() throws -> Profile?
}
