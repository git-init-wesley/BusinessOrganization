//
//  Conçu avec ♡ par Levasseur Wesley.
//  © Copyright 2021. Tous droits réservés.
//
//  Création datant du 17/05/2021.
//

import Foundation

class SignUpModel: ObservableObject {

    @Published public var emailAddress: String = ""
    @Published public var password: String = ""
    @Published public var password_confirmation: String = ""
    @Published public var userType: UserType?
    @Published public var familyName: String = ""
    @Published public var givenName: String = ""
    @Published public var phone = ""
    @Published public var phonePrefix: String = Utility.LOCALE_COUNTRY?.phone ?? "00"

    public func isOneFieldsAreEmpty() -> Bool {
        self.emailAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || self.password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || self.password_confirmation.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

}
