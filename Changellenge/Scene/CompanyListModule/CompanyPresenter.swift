//
//  CompanyListPresenter.swift
//  Changellenge
//
//  Created by Семён Соколов on 18.10.2022.
//

import UIKit

protocol CompanyPresentationLogic {
    func presentFetchedCompany(response: CompanyModels.Response)
    func presentInternetConnectionAlert()
}

class CompanyPresenter: CompanyPresentationLogic {
   
    // MARK: - Property
    
    weak var companyViewController: CompanyDisplayLogic?
    
    // MARK: - Fucntion
    
    func presentFetchedCompany(response: CompanyModels.Response) {
        var displayedEmployees: [CompanyModels.ViewModel.DisplayedEmployees] = []
        for employee in response.company.employees.sorted(by: { $0.name < $1.name } ) {
            let displayEmployee = CompanyModels.ViewModel.DisplayedEmployees(name: employee.name, phoneNumber: employee.phone_number, skills: skillsToString(skills: employee.skills))
            displayedEmployees.append(displayEmployee)
        }
        
        let displayData = CompanyModels.ViewModel(name: response.company.name, employees: displayedEmployees)
        companyViewController?.displayFetchedCompany(displayData: displayData)
    }
    
    func presentInternetConnectionAlert() {
        DispatchQueue.main.async {
            self.companyViewController?.displayInternetProblemsAlert()
        }
    }
    
    //MARK: - Private function
    
    private func skillsToString(skills: [String]) -> String {
        var stringSkills = ""
        skills.enumerated().forEach {
            $0 == skills.count - 1 ? (stringSkills += "\($1)") : (stringSkills += "\($1), ")
        }
        return stringSkills
    }
    
}
