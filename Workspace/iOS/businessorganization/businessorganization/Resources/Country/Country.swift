//
//  Conçu avec ♡ par Levasseur Wesley.
//  © Copyright 2021. Tous droits réservés.
//
//  Création datant du 20/05/2021.
//

import Foundation

struct Country: Identifiable, Codable {
    var id: UUID? = UUID()
    let code: String
    let name: String
    let native: String
    let phone: String
    let currency: String
    let emoji: String
}
