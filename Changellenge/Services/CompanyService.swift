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
    private let cache = URLCache.shared
    let companyParser: CompanyParser
    
        
    //MARK: - Fetch company
    
    func fetchCompany(stringURL: String, completion: @escaping (Result<CompanyInfo?, Error>) -> Void) {
        if let url = URL(string: stringURL) {
            let session = URLSession(configuration: self.configuration)
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            if let savedData = cache.cachedResponse(for: request)?.data {
                var result: Result<CompanyInfo?, Error>
                result = .success(companyParser.parseCompany(data: savedData))
                completion(result)
                return
            }
            
            session.dataTask(with: request) { data, recievedResponse, error in
                var result: Result<CompanyInfo?, Error>
                if let error = error {
                    result = .failure(error)
                    completion(result)
                } else if let data = data {
                    result = .success(companyParser.parseCompany(data: data))
                    guard let response = recievedResponse else { return }
                    let cacheResponse = CachedURLResponse(response: response, data: data)
                    cache.storeCachedResponse(cacheResponse, for: request)
                    completion(result)
                }
            }.resume()
            
        }
    }
    
}
