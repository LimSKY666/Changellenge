//
//  CompanyListTableViewCell.swift
//  Changellenge
//
//  Created by Семён Соколов on 18.10.2022.
//

import UIKit
import SnapKit

class CompanyTableViewCell: UITableViewCell {
    
    // MARK: - UI Component
    
    let companyNameLabel = UILabel()
    let emloyeeNameLabel = UILabel()
    let phoneNumberLabel = UILabel()
    let employeeSkillsLabel = UILabel()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure cell fucntion
    
    func configureCellData(displayData: CompanyModels.ViewModel.DisplayedEmployees) {
        emloyeeNameLabel.text = displayData.name
        employeeSkillsLabel.text = displayData.skills
        phoneNumberLabel.text = "Phone number: \(displayData.phoneNumber)"
    }
    
    // MARK: - Private functions
    
    private func configure() {
        configureEmployeeNameLabel()
        configurePhoneNumberLabel()
        configureEmployeeSkillsLabel()
    }
    
    private func configureEmployeeNameLabel() {
        addSubview(emloyeeNameLabel)
        emloyeeNameLabel.font = UIFont(name: "Helvetica", size: 22)
        emloyeeNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(8)
        }
    }
    
    private func configurePhoneNumberLabel() {
        addSubview(phoneNumberLabel)
        phoneNumberLabel.font = UIFont(name: "Helvetica", size: 17)
        phoneNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(emloyeeNameLabel).inset(20)
            make.bottom.equalToSuperview().inset(8)
            make.leading.equalToSuperview().inset(16)
        }
    }
    
    private func configureEmployeeSkillsLabel() {
        addSubview(employeeSkillsLabel)
        employeeSkillsLabel.font = UIFont(name: "Helvetica", size: 17)
        employeeSkillsLabel.numberOfLines = 0
        employeeSkillsLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(8)
            make.top.equalToSuperview().inset(8)
            make.leading.greaterThanOrEqualTo(phoneNumberLabel.snp.leading).inset(210)
            make.bottom.equalToSuperview().inset(8)
        }
    }
    
}
