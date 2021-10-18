//
//  SignUpModel.swift
//  BusinessOrganization
//
//  Created by Wesley Levasseur on 14/02/2021.
//

import Foundation

//MARK: - SignUpModel
class SignUpModel: ObservableObject {

    @Published var emailAddress: String = ""
    @Published var username: String = "" //TODO: - Entreprise/Fournisseur
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var progress: Bool = false

    func isOneFieldsFromFormAreEmpty() -> Bool {
        self.emailAddress.trimmingCharacters(in: .whitespaces).isEmpty || self.username.trimmingCharacters(in: .whitespaces).isEmpty || self.password.trimmingCharacters(in: .whitespaces).isEmpty || self.confirmPassword.trimmingCharacters(in: .whitespaces).isEmpty
    }

}
