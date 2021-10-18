//
//  SignInModel.swift
//  BusinessOrganization
//
//  Created by Wesley Levasseur on 14/02/2021.
//

import Foundation
import SwiftUI

//MARK: - SignInModel
class SignInModel: ObservableObject {

    @Published var emailAddress: String = ""
    @Published var password: String = ""
    @Published var progress: Bool = false

    func isOneFieldsFromFormAreEmpty() -> Bool {
        self.emailAddress.trimmingCharacters(in: .whitespaces).isEmpty || self.password.trimmingCharacters(in: .whitespaces).isEmpty
    }

}
