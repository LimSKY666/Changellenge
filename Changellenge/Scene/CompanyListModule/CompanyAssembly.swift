//
//  CompanyListAssembly.swift
//  Changellenge
//
//  Created by Семён Соколов on 18.10.2022.
//

import Foundation
import UIKit

protocol CompanyAssembly {
    func assemble(window: UIWindow) -> UIViewController
}

struct DefaultCompanyAssembly: CompanyAssembly {
    
    func assemble(window: UIWindow) -> UIViewController {
        let companyParser = DefaultCompanyParser()
        let companyService = DefaultCompanyService(companyParser: companyParser)
        let presenter = CompanyPresenter()
        let router = CompanyRouter()
        let interactor = CompanyInteractor(presenter: presenter, companyService: companyService)
        let viewController = CompanyViewController(interactor: interactor, router: router)
        presenter.companyViewController = viewController
        router.dataStore = interactor
        router.viewController = viewController
        window.makeKeyAndVisible()
        return viewController
    }
    
}
