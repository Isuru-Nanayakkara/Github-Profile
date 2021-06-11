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
//    private var cache: CacheService!
    
    weak private(set) var delegate: ProfilePresenterDelegate?
    
    
    init(api: APIService) {
        self.api = api
    }
    
    func setDelegate(_ delegate: ProfilePresenterDelegate) {
        self.delegate = delegate
    }
    
    func fetchProfileData() {
        api.fetchProfile { [weak self] result in
            switch result {
            case .success(let profile):
                self?.delegate?.didFetchProfileData(profile)
            case .failure(let error):
                self?.delegate?.errorOccurred(error)
            }
        }
    }
}
