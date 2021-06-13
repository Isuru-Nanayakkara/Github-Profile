//
//  ProfilePresenter.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-11.
//

import Foundation

protocol ProfilePresenterDelegate: AnyObject {
    func didFetchProfileData(_ profile: Profile)
    func errorOccurred(_ error: Error)
}

class ProfilePresenter {
    private var api: APIService!
    private var cache: CacheService!
    
    weak private(set) var delegate: ProfilePresenterDelegate?
    
    
    init(api: APIService, cache: CacheService) {
        self.api = api
        self.cache = cache
    }
    
    func setDelegate(_ delegate: ProfilePresenterDelegate) {
        self.delegate = delegate
    }
    
    /*
     First fetch the profile from the cache, if available.
     Next fetch the latest profile data from the API.
     */
    func fetchProfileData(forUser username: String, pinned: Int, top: Int, starred: Int) {
        if let profile = cache.fetchProfile() {
            delegate?.didFetchProfileData(profile)
        }
        
        api.fetchProfile(for: username, pinned: pinned, top: top, starred: starred) { [weak self] result in
            switch result {
            case .success(let profile):
                self?.cache.save(profile)
                
                self?.delegate?.didFetchProfileData(profile)
            case .failure(let error):
                self?.delegate?.errorOccurred(error)
            }
        }
    }
}
