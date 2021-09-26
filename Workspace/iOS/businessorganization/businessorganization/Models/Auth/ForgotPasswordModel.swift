//
//  Conçu avec ♡ par Levasseur Wesley.
//  © Copyright 2021. Tous droits réservés.
//
//  Création datant du 16/05/2021.
//

import Foundation

class ForgotPasswordModel: ObservableObject {

    @Published public var emailAddress: String = ""

    public func isOneFieldsAreEmpty() -> Bool {
        self.emailAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

}
