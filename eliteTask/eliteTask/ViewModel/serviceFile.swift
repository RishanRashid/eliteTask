//
//  serviceFile.swift
//  eliteTask
//
//  Created by Allnet Systems on 7/15/24.
//

import Foundation
import Alamofire

class ProfileService {
    static let shared = ProfileService()
    
    func fetchProfiles(completion: @escaping (Result<[Profile], Error>) -> Void) {
        let url = "http://ec2-3-7-253-252.ap-south-1.compute.amazonaws.com:3052/user/profiles/cb3d7d28-0cd6-4505-8f33-35f5543dfbbd"
        
        AF.request(url, method: .get).responseDecodable(of: ProfileResponse.self) { response in
            switch response.result {
            case .success(let profileResponse):
                if profileResponse.responseCode == 200, let profiles = profileResponse.profiles {
                    completion(.success(profiles))
                } else {
                    let errorMessage = profileResponse.message ?? "Unknown error"
                    let error = NSError(domain: "", code: profileResponse.responseCode ?? -1, userInfo: [NSLocalizedDescriptionKey: errorMessage])
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
