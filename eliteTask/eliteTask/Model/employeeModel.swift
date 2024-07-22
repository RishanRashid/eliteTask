//
//  employeeModel.swift
//  eliteTask
//
//  Created by Allnet Systems on 7/15/24.
//

import Foundation


//struct UserProfileTheme: Codable {
//    let user_profile_theme_id: Int?
//    let user_profile_theme_color: String?
//    let apply_color_link_icon: Bool?
//    let apply_color_qr_code: Bool?
//}

//struct SocialMedia: Codable {
//    let social_media_type: String
//    let value: String
//}

struct employeeProfile: Codable {
    let profile_id: String?
    let profile_first_name: String?
    let profile_last_name: String?
    let profile_phone_number: String?
    let profile_email: String?
    let profile_job_title: String?
    let profile_company_name: String?
    let profile_web_site: String?
    let profile_image_name: String?
//    let profile_is_deleted: Bool?
//    let collect_prospect_info: Bool?
//    let prospect_count: String?
//    let social_media: [SocialMedia]?
//    let user_profile_theme: UserProfileTheme?
}

struct EmployeesModel: Codable {
    let profiles: [employeeProfile]
}
