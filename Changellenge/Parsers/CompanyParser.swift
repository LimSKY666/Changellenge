//
//  CompanyParser.swift
//  Changellenge
//
//  Created by Семён Соколов on 18.10.2022.
//

import Foundation

protocol CompanyParser {
    func parseCompany(data: Data) -> CompanyInfo?
}

struct DefaultCompanyParser: CompanyParser {
    
    func parseCompany(data: Data) -> CompanyInfo? {
        let company = try? JSONDecoder().decode(Company.self, from: data)
        guard let recievedCompany = company else { return nil }
        
        return recievedCompany.company
    }
    
}
