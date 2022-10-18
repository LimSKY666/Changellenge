//
//  CompanyListViewContoller.swift
//  Changellenge
//
//  Created by Семён Соколов on 18.10.2022.
//

import Foundation
import UIKit
import SnapKit

protocol CompanyDisplayLogic: AnyObject{
    func displayFetchedCompany(viewModel: CompanyModels.ViewModel)
}

final class CompanyViewController: UIViewController, CompanyDisplayLogic {
    
    // MARK: - Properties
    
    var interactor: CompanyBusinessLogic?
    var company: CompanyModels.ViewModel?
    var router: (CompanyRoutingLogic & CompanyDataPassing)?
    
    // MARK: - UI Component
    
    var tableView: UITableView = {
        let table = UITableView()
        table.register(CompanyTableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    // MARK: - View life cycle
    
    override func loadView() {
        self.view = UIView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCompany()
    }
    
    // MARK: - Update table view fucntion
        
    func displayFetchedCompany(viewModel: CompanyModels.ViewModel) {
        company = viewModel
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Private functions
    
    private func fetchCompany() {
        let request = CompanyModels.Request()
        interactor?.fetchBackendCompany(request: request)
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.dataSource = self
        tableView.delegate = self
    }
        
}

// MARK: - UITableViewDataSource & UItableViewDelegate

extension CompanyViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let company = company else { return 0 }
        return company.employees.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let displayCompany = company?.employees[indexPath.row] else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CompanyTableViewCell else { return UITableViewCell() }
        cell.configureCellData(viewModel: displayCompany)
        return cell
    }
    
}
