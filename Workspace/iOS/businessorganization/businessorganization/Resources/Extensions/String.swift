//
//  Conçu avec ♡ par Levasseur Wesley.
//  © Copyright 2021. Tous droits réservés.
//
//  Création datant du 12/05/2021.
//

import Foundation

extension String {

    func localized() -> String {
        NSLocalizedString(self, tableName: "Languages", bundle: .main, value: "N/A", comment: self)
    }

}
