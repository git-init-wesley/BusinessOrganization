//
//  Conçu avec ♡ par Levasseur Wesley.
//  © Copyright 2021. Tous droits réservés.
//
//  Création datant du 20/05/2021.
//

import Foundation

class CountryStore {
    
    //MARK: Shares
    private static var share: CountryStore?
    
    private static func shared() -> CountryStore {
        if CountryStore.share == nil {
            CountryStore.share = CountryStore()
        }
        return CountryStore.share!
    }
    
    private static let countriesBundleUrl: URL = Bundle.main.url(forResource: "countries.json", withExtension: nil)!
    
    init() {
        guard let data: Data = try? Data(contentsOf: CountryStore.countriesBundleUrl) else {
            fatalError("Unable to load country data.")
        }
        guard let countries: [Country] = try? JSONDecoder().decode([Country].self, from: data) else {
            fatalError("Failed to decode JSON from the country data.")
        }
        self.countries = countries
        self.countriesName = countries.map {
            $0.name
        }
        self.countriesEmoji = countries.map {
            $0.emoji
        }
        self.countriesPhone = countries.map {
            $0.phone
        }
        self.countriesCode = countries.map {
            $0.code
        }
        self.countriesNamePhone = countries.map {
            "\($0.name) (+\($0.phone))"
        }
    }
    
    public static func getCountryFromCode(_ code: String) -> Country? {
        CountryStore.shared().countries.filter {
            $0.code.lowercased() == code.lowercased()
        }.first
    }
    
    private var countries: [Country] = []
    public static func getCountries() -> [Country] {
        CountryStore.shared().countries
    }
    private var countriesName: [String] = []
    public static func getCountriesName() -> [String] {
        CountryStore.shared().countriesName
    }
    private var countriesEmoji: [String] = []
    public static func getCountriesEmoji() -> [String] {
        CountryStore.shared().countriesEmoji
    }
    private var countriesPhone: [String] = []
    public static func getCountriesPhone() -> [String] {
        CountryStore.shared().countriesPhone
    }
    private var countriesCode: [String] = []
    public static func getCountriesCode() -> [String] {
        CountryStore.shared().countriesCode
    }
    private var countriesNamePhone: [String] = []
    public static func getCountriesNamePhone() -> [String] {
        CountryStore.shared().countriesNamePhone
    }
    
}

