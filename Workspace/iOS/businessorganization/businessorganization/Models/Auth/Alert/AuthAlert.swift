//
//  Conçu avec ♡ par Levasseur Wesley.
//  © Copyright 2021. Tous droits réservés.
//
//  Création datant du 14/05/2021.
//

import Foundation
import SwiftUI

class AuthAlert: ObservableObject {

    //MARK: Share
    private static var share: AuthAlert?

    public static func shared() -> AuthAlert {
        if AuthAlert.share == nil {
            AuthAlert.share = AuthAlert()
        }
        return AuthAlert.share!
    }

    @Published private var presented: Bool = false

    private func setPresented(_ value: Bool) {
        withAnimation {
            self.presented = value
        }
    }

    public func isPresented() -> Bool {
        self.presented
    }

    @Published private var title: String = "N/A"

    private func setTitle(_ value: String) {
        self.title = value
    }

    public func getTitle() -> String {
        self.title
    }

    @Published private var description: String = "N/A"

    private func setDescription(_ value: String) {
        self.description = value
    }

    public func getDescription() -> String {
        self.description
    }

    @Published private var imageSystemName: String = "exclamationmark.shield"

    private func setImageSystemName(_ value: String) {
        self.imageSystemName = value
    }

    public func getImageSystemName() -> String {
        self.imageSystemName
    }

    @Published private var accentColor: Color = .gray

    private func setAccentColor(_ value: Color) {
        self.accentColor = value
    }

    public func getAccentColor() -> Color {
        self.accentColor
    }

    public func newAlert(_ title: String, description: String, imageSystemName: String, accentColor: Color) {
        self.setTitle(title)
        self.setDescription(description)
        self.setImageSystemName(imageSystemName)
        self.setAccentColor(accentColor)
        self.setPresented(true)
    }

    public func closeAlert() {
        self.setPresented(false)
        self.setTitle("N/A")
        self.setDescription("N/A")
        self.setImageSystemName("exclamationmark.shield")
        self.setAccentColor(.gray)
    }

}
