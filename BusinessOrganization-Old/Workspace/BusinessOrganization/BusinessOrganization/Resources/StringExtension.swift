//
//  StringExtension.swift
//  BusinessOrganization
//
//  Created by Wesley Levasseur on 31/03/2021.
//

import Foundation

//MARK: - StringExtension
extension String {

    func localized(_ key: String) -> String {
        NSLocalizedString(key, tableName: "Lang", bundle: .main, value: self, comment: self)
    }

}
