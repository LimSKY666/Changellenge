//
//  CompanyListAssembly.swift
//  Changellenge
//
//  Created by Семён Соколов on 18.10.2022.
//

import Foundation
import UIKit

protocol CompanyAssembly {
    func assemble() -> UIViewController
}

struct DefaultCompanyAssembly: CompanyAssembly {
    
    func assemble() -> UIViewController {
        let companyParser = DefaultCompanyParser()
        let companyService = DefaultCompanyService(companyParser: companyParser)
        let viewController = CompanyViewController()
        let interactor = CompanyInteractor()
        let presenter = CompanyPresenter()
        let router = CompanyRouter()
        viewController.interactor = interactor
        viewController.router = router
        presenter.companyViewController = viewController
        interactor.presenter = presenter
        interactor.companyService = companyService
        router.dataStore = interactor
        router.viewController = viewController
        return viewController
    }
    
}
