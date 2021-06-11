//
//  DiskCache.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-11.
//

import Foundation

/*
 Encodes the data as JSON and save on disk.
 */
class DiskCache: Cache {
    private let filename = "profile"
    
    func saveProfile(_ profile: Profile) throws {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        if let url = urls.first {
            let fileURL = url.appendingPathComponent(filename).appendingPathExtension("json")
            
            let data = try JSONEncoder().encode(profile)
            // If a file does not exist, create it.
            if !fileManager.fileExists(atPath: fileURL.path) {
                fileManager.createFile(atPath: fileURL.path, contents: data, attributes: nil)
            }
            try data.write(to: fileURL, options: [.atomicWrite])
        }
    }
    
    func fetchProfile() throws -> Profile? {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        if let url = urls.first {
            let fileURL = url.appendingPathComponent(filename).appendingPathExtension("json")
            
            let data = try Data(contentsOf: fileURL)
            let profile = try JSONDecoder().decode(Profile.self, from: data)
            
            return profile
        } else {
            return nil
        }
    }
    
}
