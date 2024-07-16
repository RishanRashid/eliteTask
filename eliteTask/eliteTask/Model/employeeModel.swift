//
//  employeeModel.swift
//  eliteTask
//
//  Created by Allnet Systems on 7/15/24.
//

import Foundation

struct Profile: Codable {
    let profileId: String?
    let profileFirstName: String?
    let profileLastName: String?
    let profileJobTitle: String?
    let profileCompanyName: String?
}

struct ProfileResponse: Codable {
    let responseCode: Int?
    let message: String?
    let profiles: [Profile]?
    
    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case message
        case profiles
    }
}
