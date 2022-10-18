//
//  CompanyListModels.swift
//  Changellenge
//
//  Created by Семён Соколов on 18.10.2022.
//

import Foundation

struct Company: Decodable {
    let company: CompanyInfo
}

struct CompanyInfo: Decodable {
    let name: String
    let employees: [EmployeeInfo]
}

struct EmployeeInfo: Decodable {
    let name: String
    let phone_number: String
    let skills: [String]
}
