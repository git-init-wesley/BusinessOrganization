//
//  ForgotPasswordModel.swift
//  BusinessOrganization
//
//  Created by Wesley Levasseur on 15/02/2021.
//

import Foundation

//MARK: - ForgotPasswordModel
class ForgotPasswordModel: ObservableObject {

    @Published var emailAddress: String = ""
    @Published var progress: Bool = false

    func isOneFieldsFromFormAreEmpty() -> Bool {
        self.emailAddress.trimmingCharacters(in: .whitespaces).isEmpty
    }

}
