//
//  Conçu avec ♡ par Levasseur Wesley.
//  © Copyright 2021. Tous droits réservés.
//
//  Création datant du 16/05/2021.
//

import Foundation

extension SignInView {

    public func signIn() {
        self.user.setAuthLoadingText("Connection".localized())
        self.user.setAuthLoading(true)

        let emailAddress: String = self.model.emailAddress.trimmingCharacters(in: .whitespacesAndNewlines)
        guard Utility.isValidEmailAddress(emailAddress) else {
            self.user.setAuthLoading(false)
            self.alert.newAlert("Warning".localized(), description: "Email_address_malformated".localized(), imageSystemName: "exclamationmark.circle", accentColor: .orange)
            return
        }

        let password: String = self.model.password.trimmingCharacters(in: .whitespacesAndNewlines)
        guard Utility.isValidPassword(password) else {
            self.user.setAuthLoading(false)
            self.alert.newAlert("Warning".localized(), description: "Password_malformated".localized(), imageSystemName: "exclamationmark.circle", accentColor: .orange)
            return
        }

        self.user.auth { (sucess: Bool, error: String) in
            if !sucess {
                self.alert.newAlert("Erreur", description: error, imageSystemName: "xmark.circle", accentColor: .red)
            }
        }
    }

}
