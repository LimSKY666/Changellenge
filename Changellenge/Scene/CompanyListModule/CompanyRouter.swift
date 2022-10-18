//
//  CompanyListRouter.swift
//  Changellenge
//
//  Created by Семён Соколов on 18.10.2022.
//

import Foundation

protocol CompanyRoutingLogic {
    
}

protocol CompanyDataPassing {
    var dataStore: CompanyDataStore? { get set }
}

final class CompanyRouter: CompanyRoutingLogic, CompanyDataPassing {
    
    // MARK: - Properties
    
    var dataStore: CompanyDataStore?
    weak var viewController: CompanyViewController?
    
}
