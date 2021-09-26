//
//  Conçu avec ♡ par Levasseur Wesley.
//  © Copyright 2021. Tous droits réservés.
//
//  Création datant du 12/05/2021.
//

import SwiftUI

@main
struct LaunchApp: App {

    @ObservedObject private var user: User = User.shared()
    
    var body: some Scene {
        WindowGroup {
            ZStack(alignment: .center) {
                AuthView()
                        .scaleEffect(self.user.isAuthentified() ? 0 : 1)
                        .blur(radius: self.user.isAuthentified() ? 3.0 : 0)
                        .opacity(self.user.isAuthentified() ? 0 : 1)
                TestView()
                        .scaleEffect(self.user.isAuthentified() ? 1 : 0)
                        .blur(radius: self.user.isAuthentified() ? 0 : 3.0)
                        .opacity(self.user.isAuthentified() ? 1 : 0)
            }
        }
    }

}

struct TestView: View {

    @ObservedObject private var user: User = User.shared()

    var body: some View {
        VStack(spacing: 15) {
            Text(Utility.LOCALE_LANGUAGE_CODE ?? "NUL")
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(30)
            Text(Utility.LOCALE_LANGUAGE_CODE ?? "NUL")
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(30)
            Text(Utility.LOCALE_LANGUAGE_CODE ?? "NUL")
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(30)
            Text(Utility.LOCALE_LANGUAGE_CODE ?? "NUL")
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(30)
            Button(action: { self.user.logout() }) {
                Text("Logout")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color.accentColor)
                        .clipShape(Capsule())
            }
                    .padding(.top)
        }
    }

}
