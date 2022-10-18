//
//  CompanyListModels.swift
//  Changellenge
//
//  Created by Семён Соколов on 18.10.2022.
//

import Foundation

enum CompanyModels {
    
    struct Request {
        
    }
    
    struct Response {
        var company: CompanyInfo
    }
    
    struct ViewModel {
        
        struct DisplayedEmployees {
            var name: String
            var phoneNumber: String
            var skills: String
        }
        
        var name: String
        var employees: [DisplayedEmployees]
    }
    
}
