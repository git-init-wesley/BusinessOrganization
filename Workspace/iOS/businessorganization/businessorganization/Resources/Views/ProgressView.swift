//
//  Conçu avec ♡ par Levasseur Wesley.
//  © Copyright 2021. Tous droits réservés.
//
//  Création datant du 14/05/2021.
//

import SwiftUI

struct ProgressView: View {

    private var placeholder: String
    private var placeholderForegroundColor: Color
    private var placeholderFontWeight: Font.Weight
    private var firstLineColors: [Color]
    private var firstLineWidth: CGFloat
    private var secondLineColors: [Color]
    private var secondLineWidth: CGFloat

    @State private var animate: Bool = false

    init(_ placeholder: String?, placeholderForegroundColor: Color?, placeholderFontWeight: Font.Weight?, firstLineColors: [Color]?, firstLineWidth: CGFloat?, secondLineColors: [Color]?, secondLineWidth: CGFloat?) {
        self.placeholder = placeholder ?? "-NIL/"
        self.placeholderForegroundColor = placeholderForegroundColor ?? .primary
        self.placeholderFontWeight = placeholderFontWeight ?? .bold
        self.firstLineColors = firstLineColors ?? [.primary, .clear]
        self.firstLineWidth = firstLineWidth ?? 1
        self.secondLineColors = secondLineColors ?? [.primary, .clear]
        self.secondLineWidth = secondLineWidth ?? 1

    }

    var body: some View {
        VStack {
            ZStack {
                Circle()
                        .stroke(AngularGradient(gradient: .init(colors: self.firstLineColors), center: .center), lineWidth: self.firstLineWidth)
                        .frame(width: 40, height: 50)
                        .rotationEffect(.init(degrees: self.animate ? 0 : 360))
                Circle()
                        .stroke(AngularGradient(gradient: .init(colors: self.secondLineColors), center: .center), lineWidth: self.secondLineWidth)
                        .frame(width: 50, height: 50)
                        .rotationEffect(.init(degrees: self.animate ? 360 : 0))
            }
            if self.placeholder != "-NIL/" {
                Text(self.placeholder)
                        .fontWeight(self.placeholderFontWeight)
                        .foregroundColor(self.placeholderForegroundColor)
            }
        }
                .padding(.vertical, 25)
                .padding(.horizontal, 35)
                .background(BlurView())
                .cornerRadius(50)
                .onAppear {
                    withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                        self.animate.toggle()
                    }
                }
    }
}
