//
//  Conçu avec ♡ par Levasseur Wesley.
//  © Copyright 2021. Tous droits réservés.
//
//  Création datant du 21/05/2021.
//
// __FR:__ Dernière mise à jour le 1er juillet 2020
// __EN:__ Last updated July 1, 2020
//

import Foundation

struct LegalCategory: Identifiable, Codable {
    var id: UUID? = UUID()
    let level: LegalCategoryLevels
    let values: [LegalCategoryValue]
}

struct LegalCategoryValue: Identifiable, Codable {
    var id: UUID? = UUID()
    let code: String
    let name: String
}

enum LegalCategoryLevels: String, Codable {
    case One, Two, Three
    
    public func get() -> LegalCategory {
        switch self {
            case .One:
                return LegalCategoryStore.getLegalCategoryLevelOne()
            case .Two:
                return LegalCategoryStore.getLegalCategoryLevelTwo()
            case .Three:
                return LegalCategoryStore.getLegalCategoryLevelThree()
        }
    }
    
    public static func getAll() -> [LegalCategory] {
        LegalCategoryStore.getLegalsCategory()
    }
}
