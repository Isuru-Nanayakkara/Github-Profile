//
//  Github_ProfileTests.swift
//  Github ProfileTests
//
//  Created by Isuru Nanayakkara on 2021-06-12.
//

import XCTest
@testable import Github_Profile

class Github_ProfileTests: XCTestCase {
    private let username = "Isuru-Nanayakkara"
    private let pinned = 3
    private let top = 10
    private let starred = 10
    private var sut: ProfilePresenter!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let apiService = APIService(api: MockAPI())
        let cacheService = CacheService(cache: MockCache())
        sut = ProfilePresenter(api: apiService, cache: cacheService)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testFetchFirstThreePinnedRepos() {
        let spyDelegate = SpyDelegate()
        sut.setDelegate(spyDelegate)
        
        let expectation = expectation(description: "ProfilePresenter calls the didFetchProfileData delegate method with profile object")
        spyDelegate.expectation = expectation
        
        sut.fetchProfileData(forUser: username, pinned: pinned, top: top, starred: starred)
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout error: \(error.localizedDescription)")
            }
            guard let result = spyDelegate.result else {
                XCTFail("Expected delegate to be called")
                return
            }
            XCTAssertEqual(result.pinnedRepos.count, 3)
        }
    }
    
    func testFetchFirstTenTopRepos() {
        let spyDelegate = SpyDelegate()
        sut.setDelegate(spyDelegate)
        
        let expectation = expectation(description: "ProfilePresenter calls the didFetchProfileData delegate method with profile object")
        spyDelegate.expectation = expectation
        
        sut.fetchProfileData(forUser: username, pinned: pinned, top: top, starred: starred)
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout error: \(error.localizedDescription)")
            }
            guard let result = spyDelegate.result else {
                XCTFail("Expected delegate to be called")
                return
            }
            XCTAssertEqual(result.topRepos.count, 10)
        }
    }
    
    func testFetchFirstTenStarredRepos() {
        let spyDelegate = SpyDelegate()
        sut.setDelegate(spyDelegate)
        
        let expectation = expectation(description: "ProfilePresenter calls the didFetchProfileData delegate method with profile object")
        spyDelegate.expectation = expectation
        
        sut.fetchProfileData(forUser: username, pinned: pinned, top: top, starred: starred)
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout error: \(error.localizedDescription)")
            }
            guard let result = spyDelegate.result else {
                XCTFail("Expected delegate to be called")
                return
            }
            XCTAssertEqual(result.starredRepos.count, 10)
        }
    }
}

class SpyDelegate: ProfilePresenterDelegate {
    var result: Profile!
    var expectation: XCTestExpectation?
    
    func didFetchProfileData(_ profile: Profile) {
        result = profile
        expectation?.fulfill()
    }
    
    func errorOccurred(_ error: Error) {
        
    }
}
