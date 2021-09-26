//
//  Conçu avec ♡ par Levasseur Wesley.
//  © Copyright 2021. Tous droits réservés.
//
//  Création datant du 13/05/2021.
//

import SwiftUI

struct AuthView: View {

    @State private var selection: Int = SignInView.TAG
    @ObservedObject private var user: User = User.shared()
    @ObservedObject private var alert: AuthAlert = AuthAlert.shared()

    var body: some View {
        ZStack(alignment: .center) {
            Group {
                SignInView(selection: self.$selection)
                        .scaleEffect(self.selection == SignInView.TAG ? 1 : 0)
                        .blur(radius: self.selection == SignInView.TAG ? 0 : 3.0)
                        .opacity(self.selection == SignInView.TAG ? 1 : 0)
                SignUpView(selection: self.$selection)
                        .scaleEffect(self.selection == SignUpView.TAG ? 1 : 0)
                        .blur(radius: self.selection == SignUpView.TAG ? 0 : 3.0)
                        .opacity(self.selection == SignUpView.TAG ? 1 : 0)
                ForgotPasswordView(selection: self.$selection)
                        .scaleEffect(self.selection == ForgotPasswordView.TAG ? 1 : 0)
                        .blur(radius: self.selection == ForgotPasswordView.TAG ? 0 : 3.0)
                        .opacity(self.selection == ForgotPasswordView.TAG ? 1 : 0)
            }
                    .disabled(self.alert.isPresented() || self.user.isAuthLoading())
                    .blur(radius: self.alert.isPresented() || self.user.isAuthLoading() ? 3.0 : 0)
            if self.alert.isPresented() {
                AlertView(self.alert.getTitle(),
                        titleForegroundColor: self.alert.getAccentColor(),
                        titleFontWeight: .none,
                        description: self.alert.getDescription(),
                        descriptionForegroundColor: .none,
                        descriptionFontWeight: .none,
                        imageSystemName: self.alert.getImageSystemName(),
                        imageColor: self.alert.getAccentColor(),
                        actionBackground: {
                            self.alert.closeAlert()
                        },
                        buttons: [
                            AlertButtonView("I_get_it".localized(), fontWeight: .regular, forgroundColor: .none, backgroundColor: .accentColor, action: {
                                self.alert.closeAlert()
                            })
                        ])
                        .ignoresSafeArea(.all, edges: .all)
                        .scaleEffect(self.alert.isPresented() ? 1 : 0)
                        .blur(radius: self.alert.isPresented() ? 0 : 3.0)
                        .animation(.easeInOut)
            }
            if self.user.isAuthLoading() {
                ProgressView(self.user.getAuthLoadingText(), placeholderForegroundColor: .none, placeholderFontWeight: .none, firstLineColors: .none, firstLineWidth: .none, secondLineColors: .none, secondLineWidth: .none)
                        .ignoresSafeArea(.all, edges: .all)
                        .scaleEffect(self.user.isAuthLoading() ? 1 : 0)
                        .blur(radius: self.user.isAuthLoading() ? 0 : 3.0)
            }
        }
    }

}
