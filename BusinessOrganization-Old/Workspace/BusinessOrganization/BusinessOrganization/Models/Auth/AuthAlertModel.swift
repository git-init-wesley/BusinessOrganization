//
//  AuthAlertModel.swift
//  BusinessOrganization
//
//  Created by Wesley Levasseur on 15/02/2021.
//

import Foundation
import SwiftUI

//MARK: - AuthAlertModel
class AuthAlertModel: ObservableObject {

    @Published var authAlertSymbol: String = ""
    @Published var authAlertAccentColor: Color = .black
    @Published var authAlertTitle: String = ""
    @Published var authAlertDescription: String = ""
    @Published var isAuthAlertPresented: Bool = false

    func newAuthAlert(symbol: String, accentColor: Color, title: String, description: String) {
        self.authAlertSymbol = symbol
        self.authAlertAccentColor = accentColor
        self.authAlertTitle = title
        self.authAlertDescription = description
        self.isAuthAlertPresented = true
    }

}
