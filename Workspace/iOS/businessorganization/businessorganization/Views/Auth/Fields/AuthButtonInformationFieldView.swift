//
//  Conçu avec ♡ par Levasseur Wesley.
//  © Copyright 2021. Tous droits réservés.
//
//  Création datant du 19/05/2021.
//

import SwiftUI

struct AuthButtonInformationFieldView: View {

    private var action: () -> ()

    init(_ action: @escaping () -> ()) {
        self.action = action
    }

    var body: some View {
        Spacer(minLength: 0)
        Button(action: self.action) {
            Image(systemName: "info.circle")
                    .font(.title2)
                    .foregroundColor(Color.primary.opacity(0.5))
                    .frame(width: 35)
        }
    }
}
