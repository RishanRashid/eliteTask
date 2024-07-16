//
//  eliteTaskTests.swift
//  eliteTaskTests
//
//  Created by Allnet Systems on 7/15/24.
//

import XCTest
@testable import eliteTask

protocol ProfileServiceProtocol {
    func fetchProfiles(completion: @escaping (Result<[employeeProfile], Error>) -> Void)
}

class MainViewModelTests: XCTestCase {
    
    var viewModel: mainViewModel!
    var mockService: serviceFile!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        mockService = serviceFile()
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        mockService = nil
        try super.tearDownWithError()
    }
    
    func testFetchProfilesSuccess() throws {
        let expectation = expectation(description: "Fetch profiles")
        var capturedProfiles: [employeeProfile]?
        var capturedError: Error?
        
        viewModel.onProfilesUpdated = {
            capturedProfiles = self.viewModel.profiles
            expectation.fulfill()
        }
        viewModel.onError = { error in
            capturedError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: error])
            expectation.fulfill()
        }
        
        viewModel.fetchProfiles()
        
        waitForExpectations(timeout: 5) { error in
            XCTAssertNil(error, "Timeout")
            XCTAssertNotNil(capturedProfiles, "Profiles should not be nil on success")
            XCTAssertNil(capturedError, "Error should be nil on success")
        }
    }
    
    func testFetchProfilesFailure() throws {
        let expectation = expectation(description: "Fetch profiles")
        var capturedProfiles: [employeeProfile]?
        var capturedError: Error?
        
        viewModel.onProfilesUpdated = {
            capturedProfiles = self.viewModel.profiles
            expectation.fulfill()
        }
        viewModel.onError = { error in
            capturedError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: error])
            expectation.fulfill()
        }
        
        viewModel.fetchProfiles()
        
        waitForExpectations(timeout: 5) { error in
            XCTAssertNil(error, "Timeout")
            XCTAssertNil(capturedProfiles, "Profiles should be nil on failure")
            XCTAssertNotNil(capturedError, "Error should not be nil on failure")
        }
    }
}

// MockProfileService for providing mock data
class MockProfileService: ProfileServiceProtocol {
    
    var shouldSucceed = true
    
    func fetchProfiles(completion: @escaping (Result<[employeeProfile], Error>) -> Void) {
        if shouldSucceed {
            let profiles = [
                employeeProfile(profile_id: "1", profile_first_name: "Mohammad", profile_last_name: "Iqbal", profile_phone_number: "9876543210", profile_email: "mohammad.iqbal@elite.com", profile_job_title: "iOSDeveloper", profile_company_name: "Tech Inc", profile_web_site: "www.techinc.com", profile_image_name: "john_doe.jpg"),
                employeeProfile(profile_id: "2", profile_first_name: "Jane", profile_last_name: "Smith", profile_phone_number: "9876543210", profile_email: "jane.smith@example.com", profile_job_title: "Designer", profile_company_name: "Design Co", profile_web_site: "www.designco.com", profile_image_name: "jane_smith.jpg")
            ]
            completion(.success(profiles))
        } else {
            let error = NSError(domain: "MockProfileService", code: 500, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch profiles"])
            completion(.failure(error))
        }
    }
}
