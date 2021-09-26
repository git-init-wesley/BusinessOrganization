//
//  LegalCategoryStore.swift
//  businessorganization
//
//  Created by Wesley Levasseur on 21/05/2021.
//

import Foundation

class LegalCategoryStore {
    
    //MARK: Shares
    private static var share: LegalCategoryStore?
    
    private static func shared() -> LegalCategoryStore {
        if LegalCategoryStore.share == nil {
            LegalCategoryStore.share = LegalCategoryStore()
        }
        return LegalCategoryStore.share!
    }
    
    private static let legalsCategoryBundleUrl: URL = Bundle.main.url(forResource: "legals_category.json", withExtension: nil)!
    
    
    init() {
        guard let dataLegalsCategory: Data = try? Data(contentsOf: LegalCategoryStore.legalsCategoryBundleUrl) else {
            fatalError("Unable to load legals category data.")
        }
        guard let legalsCategory: [LegalCategory] = try? JSONDecoder().decode([LegalCategory].self, from: dataLegalsCategory) else {
            fatalError("Failed to decode JSON from the legals category data.")
        }
        self.legalsCategory = legalsCategory
        var legalsCategoryName: [String] = []
        var legalsCategoryCode: [String] = []
        var legalCategoryLevelOne: LegalCategory = LegalCategory(level: .One, values: [])
        var legalCategoryLevelOneName: [String] = []
        var legalCategoryLevelOneCode: [String] = []
        var legalCategoryLevelTwo: LegalCategory = LegalCategory(level: .Two, values: [])
        var legalCategoryLevelTwoName: [String] = []
        var legalCategoryLevelTwoCode: [String] = []
        var legalCategoryLevelThree: LegalCategory = LegalCategory(level: .Three, values: [])
        var legalCategoryLevelThreeName: [String] = []
        var legalCategoryLevelThreeCode: [String] = []
        legalsCategory.forEach { (legalCategory: LegalCategory) in
            legalsCategoryName += legalCategory.values.map {
                $0.name
            }
            legalsCategoryCode += legalCategory.values.map {
                $0.code
            }
            switch legalCategory.level {
                case .One:
                    legalCategoryLevelOne = legalCategory
                    legalCategoryLevelOneName += legalCategory.values.map {
                        $0.name
                    }
                    legalCategoryLevelOneCode += legalCategory.values.map {
                        $0.code
                    }
                    break
                case.Two:
                    legalCategoryLevelTwo = legalCategory
                    legalCategoryLevelTwoName += legalCategory.values.map {
                        $0.name
                    }
                    legalCategoryLevelTwoCode += legalCategory.values.map {
                        $0.code
                    }
                    break
                case .Three:
                    legalCategoryLevelThree = legalCategory
                    legalCategoryLevelThreeName += legalCategory.values.map {
                        $0.name
                    }
                    legalCategoryLevelThreeCode += legalCategory.values.map {
                        $0.code
                    }
                    break
            }
        }
        self.legalsCategoryName = legalsCategoryName
        self.legalsCategoryCode = legalsCategoryCode
        self.legalCategoryLevelOne = legalCategoryLevelOne
        self.legalCategoryLevelOneName = legalCategoryLevelOneName
        self.legalCategoryLevelOneCode = legalCategoryLevelOneCode
        self.legalCategoryLevelTwo = legalCategoryLevelTwo
        self.legalCategoryLevelTwoName = legalCategoryLevelTwoName
        self.legalCategoryLevelTwoCode = legalCategoryLevelTwoCode
        self.legalCategoryLevelThree = legalCategoryLevelThree
        self.legalCategoryLevelThreeName = legalCategoryLevelThreeName
        self.legalCategoryLevelThreeCode = legalCategoryLevelThreeCode
    }
    
    private var legalsCategory: [LegalCategory]
    public static func getLegalsCategory() -> [LegalCategory] {
        LegalCategoryStore.shared().legalsCategory
    }
    private var legalsCategoryName: [String]
    public static func getLegalsCategoryName() -> [String] {
        LegalCategoryStore.shared().legalsCategoryName
    }
    private var legalsCategoryCode: [String]
    public static func getLegalsCategoryCode() -> [String] {
        LegalCategoryStore.shared().legalsCategoryCode
    }
    private var legalCategoryLevelOne: LegalCategory
    public static func getLegalCategoryLevelOne() -> LegalCategory {
        LegalCategoryStore.shared().legalCategoryLevelOne
    }
    private var legalCategoryLevelOneName: [String]
    public static func getLegalCategoryLevelOneName() -> [String] {
        LegalCategoryStore.shared().legalCategoryLevelOneName
    }
    private var legalCategoryLevelOneCode: [String]
    public static func getLegalCategoryLevelOneCode() -> [String] {
        LegalCategoryStore.shared().legalCategoryLevelOneCode
    }
    private var legalCategoryLevelTwo: LegalCategory
    public static func getLegalCategoryLevelTwo() -> LegalCategory {
        LegalCategoryStore.shared().legalCategoryLevelTwo
    }
    private var legalCategoryLevelTwoName: [String]
    public static func getLegalCategoryLevelTwoName() -> [String] {
        LegalCategoryStore.shared().legalCategoryLevelTwoName
    }
    private var legalCategoryLevelTwoCode: [String]
    public static func getLegalCategoryLevelTwoCode() -> [String] {
        LegalCategoryStore.shared().legalCategoryLevelTwoCode
    }
    private var legalCategoryLevelThree: LegalCategory
    public static func getLegalCategoryLevelThree() -> LegalCategory {
        LegalCategoryStore.shared().legalCategoryLevelThree
    }
    private var legalCategoryLevelThreeName: [String]
    public static func getLegalCategoryLevelThreeName() -> [String] {
        LegalCategoryStore.shared().legalCategoryLevelThreeName
    }
    private var legalCategoryLevelThreeCode: [String]
    public static func getLegalCategoryLevelThreeCode() -> [String] {
        LegalCategoryStore.shared().legalCategoryLevelThreeCode
    }
    
    public static func getLegalCategoryFromCode(_ code: String) -> LegalCategory? {
        LegalCategoryStore.shared().legalsCategory.filter {
            $0.values.filter {
                $0.code.lowercased() == code.lowercased()
                }.first != nil
        }.first
    }
}

