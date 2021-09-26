//
//  Conçu avec ♡ par Levasseur Wesley.
//  © Copyright 2021. Tous droits réservés.
//
//  Création datant du 13/05/2021.
//

import Foundation
import SwiftUI

class User: ObservableObject {


    //MARK: Shares
    private static var share: User?

    public static func shared() -> User {
        if User.share == nil {
            User.share = User()
        }
        return User.share!
    }


    //MARK: Generals
    @Published private var loading: Bool = true

    public func setLoading(_ value: Bool) {
        withAnimation {
            self.loading = value
        }
    }

    public func isLoading() -> Bool {
        self.loading;
    }

    @Published private var authLoading: Bool = false

    public func setAuthLoading(_ value: Bool) {
        withAnimation {
            self.authLoading = value
        }
    }

    public func isAuthLoading() -> Bool {
        self.authLoading
    }

    @Published private var authLoadingText: String = "N/A"

    public func setAuthLoadingText(_ value: String) {
        self.authLoadingText = value
    }

    public func getAuthLoadingText() -> String {
        self.authLoadingText
    }

    //MARK: Authentification
    @Published private var authentified: Bool = false

    private func setAuthentified(_ value: Bool) {
        withAnimation(.spring()) {
            self.authentified = value
        }
    }

    public func isAuthentified() -> Bool {
        self.authentified;
    }

    //private var authentificationListener: AuthStateDidChangeListenerHandle?

    public func auth(_ handle: @escaping (_ sucess: Bool, _ error: String) -> ()) {
        self.setAuthLoading(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.setAuthLoading(false)
            if self.isLoading() {
                handle(false, "Soon...")
            } else {
                self.setAuthentified(true)
            }
            self.setLoading(!self.isLoading())
        }
    }

    public func logout() {
        self.setAuthentified(false)
    }
}
