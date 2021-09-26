//
//  Conçu avec ♡ par Levasseur Wesley.
//  © Copyright 2021. Tous droits réservés.
//
//  Création datant du 13/05/2021.
//

import SwiftUI

struct AlertView: View {

    private var title: String
    private var titleForegroundColor: Color
    private var titleFontWeight: Font.Weight
    private var description: String
    private var descriptionForegroundColor: Color
    private var descriptionFontWeight: Font.Weight
    private var imageSystemName: String
    private var imageColor: Color
    private var actionBackground: () -> ()
    private var buttons: [AlertButtonView]

    init(_ title: String,
         titleForegroundColor: Color?,
         titleFontWeight: Font.Weight?,
         description: String?,
         descriptionForegroundColor: Color?,
         descriptionFontWeight: Font.Weight?,
         imageSystemName: String,
         imageColor: Color?,
         actionBackground:@escaping () -> (),
         buttons: [AlertButtonView]?
    ) {
        self.title = title
        self.titleForegroundColor = titleForegroundColor ?? .blue
        self.titleFontWeight = titleFontWeight ?? .bold
        self.description = description ?? "-NIL/"
        self.descriptionForegroundColor = descriptionForegroundColor ?? .primary
        self.descriptionFontWeight = descriptionFontWeight ?? .regular
        self.imageSystemName = imageSystemName
        self.imageColor = imageColor ?? .blue
        self.actionBackground = actionBackground
        self.buttons = buttons ?? []
    }

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 25) {
                    Image(systemName: self.imageSystemName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(self.imageColor)
                    Text(self.title)
                            .font(.title)
                            .fontWeight(self.titleFontWeight)
                            .foregroundColor(self.titleForegroundColor)
                    if description != "-NIL/" {
                        Text(self.description)
                                .fontWeight(self.descriptionFontWeight)
                                .foregroundColor(self.descriptionForegroundColor)
                    }
                    if !buttons.isEmpty {
                        Spacer(minLength: 0)
                        VStack {
                            ForEach(0..<buttons.count) { i in
                                buttons[i]
                            }
                        }
                    }
                }
                        .padding(.vertical, 25)
                        .padding(.horizontal, 30)
                        .background(BlurView())
                        .cornerRadius(50)
            }
                    .frame(alignment: .center)
        }
        .padding(UIScreen.main.bounds.height * 0.05)
        .background(BlurView().opacity(0.01).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height).ignoresSafeArea(.all, edges: .all).onTapGesture(perform: self.actionBackground))
    }

}
