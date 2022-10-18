//
//  CompanyService.swift
//  Changellenge
//
//  Created by Семён Соколов on 18.10.2022.
//

import Foundation

protocol CompanyService {
    func fetchCompany(stringURL: String, completion: @escaping (CompanyInfo?, Error?) -> Void)
}

struct DefaultCompanyService: CompanyService {
    
    // MARK: - Properties
    
    private let configuration = URLSessionConfiguration.default
    let companyParser: CompanyParser
    
    //MARK: - Fetch company
    
    func fetchCompany(stringURL: String, completion: @escaping (CompanyInfo?, Error?) -> Void) {
        if let url = URL(string: stringURL) {
            let session = URLSession(configuration: self.configuration)
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData)
            request.httpMethod = "GET"
            session.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(nil, error)
                } else if let data = data {
                    completion(companyParser.parseCompany(data: data), nil)
                }
            }.resume()
        }
    }
    
}
