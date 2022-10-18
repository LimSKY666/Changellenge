//
//  CompanyService.swift
//  Changellenge
//
//  Created by Семён Соколов on 18.10.2022.
//

import Foundation

protocol CompanyService {
    func fetchCompany(stringURL: String, completion: @escaping (Result<CompanyInfo?, Error>) -> Void)
}

struct DefaultCompanyService: CompanyService {
   
    // MARK: - Properties
    
    private let configuration = URLSessionConfiguration.default
    let companyParser: CompanyParser
        
    //MARK: - Fetch company
    
    func fetchCompany(stringURL: String, completion: @escaping (Result<CompanyInfo?, Error>) -> Void) {
        if let url = URL(string: stringURL) {
            let session = URLSession(configuration: self.configuration)
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData)
            request.httpMethod = "GET"
            session.dataTask(with: request) { data, response, error in
                var result: Result<CompanyInfo?, Error>
                if let error = error {
                    result = .failure(error)
                } else if let data = data {
                    result = .success(companyParser.parseCompany(data: data))
                    completion(result)
                }
            }.resume()
        }
    }
    
}
