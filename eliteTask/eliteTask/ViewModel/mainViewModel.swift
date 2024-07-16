//
//  mainViewModel.swift
//  eliteTask
//
//  Created by Allnet Systems on 7/15/24.
//

import Foundation


class mainViewModel {
    private var profiles: [Profile] = []
    var onProfilesUpdated: (() -> Void)?
    var onError: ((String) -> Void)?
    
    func fetchProfiles() {
        ProfileService.shared.fetchProfiles { [weak self] result in
            switch result {
            case .success(let profiles):
                self?.profiles = profiles
                DispatchQueue.main.async {
                    self?.onProfilesUpdated?()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.onError?(error.localizedDescription)
                }
            }
        }
    }
    
    func getProfile(at index: Int) -> Profile? {
        guard index >= 0 && index < profiles.count else { return nil }
        return profiles[index]
    }
    
    var numberOfProfiles: Int {
        return profiles.count
    }
}
