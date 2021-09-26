//
//  Conçu avec ♡ par Levasseur Wesley.
//  © Copyright 2021. Tous droits réservés.
//
//  Création datant du 13/05/2021.
//

import SwiftUI

struct AlertButtonView: View {

    private var title: String
    private var fontWeight: Font.Weight
    private var forgroundColor: Color
    private var backgroundColor: Color?
    private var action: () -> ()

    init(_ title: String, fontWeight: Font.Weight?, forgroundColor: Color?, backgroundColor: Color?, action: @escaping () -> ()) {
        self.title = title
        self.fontWeight = fontWeight ?? .bold
        self.forgroundColor = forgroundColor ?? .primary
        self.backgroundColor = backgroundColor
        self.action = action
    }

    var body: some View {
        Button(action: self.action) {
            Text(self.title)
                    .foregroundColor(self.forgroundColor)
                    .fontWeight(self.fontWeight)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 25)
                    .background(self.backgroundColor ?? nil)
                    .clipShape(Capsule())
        }
    }

}
