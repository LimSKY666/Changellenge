//
//  CompanyListInteractor.swift
//  Changellenge
//
//  Created by Семён Соколов on 18.10.2022.
//

import Foundation

protocol CompanyBusinessLogic {
    func fetchBackendCompany(request: CompanyModels.Request)
}

protocol CompanyDataStore {
    var company: CompanyInfo? { get set }
}

class CompanyInteractor: CompanyBusinessLogic, CompanyDataStore {
    
    // MARK: - Properties
    
    var presenter: CompanyPresentationLogic?
    var company: CompanyInfo?
    var companyService: CompanyService?
    
    //MARK: - Fetch company
    
    func fetchBackendCompany(request: CompanyModels.Request) {
        fetchCompany(stringURL: Configuration.baseURL) { [weak self] recievedCompany in
            guard let self = self else { return }
            self.company = recievedCompany
            guard let company = self.company else { return }
            let response = CompanyModels.Response(company: company)
            self.presenter?.presentFetchedCompany(response: response)
        }
    }
    
    private func fetchCompany(stringURL: String, completion: @escaping (CompanyInfo?) -> Void) {
        companyService?.fetchCompany(stringURL: stringURL, completion: {
            company, error in
            if let company = company {
                completion(company)
            } else if let error = error {
                print(error)
            }
        })
    }
    
}
