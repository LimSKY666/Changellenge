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
    
    let jsonDecoder = JSONDecoder()
    
    func parseCompany(data: Data) -> CompanyInfo? {
        let company = try? jsonDecoder.decode(Company.self, from: data)
        guard let recievedCompany = company else { return nil }
        
        return recievedCompany.company
    }
    
}
