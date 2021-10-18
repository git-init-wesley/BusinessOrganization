//
//  ProgressView.swift
//  BusinessOrganization
//
//  Created by Wesley Levasseur on 31/03/2021.
//

import SwiftUI

//MARK: - ProgressView
struct ProgressView: View {
    
    var placeholder: String
    @State var animate: Bool = false
    
    var body: some View {
        VStack {
            Circle()
                .stroke(AngularGradient(gradient: .init(colors: [Color.primary, .clear]), center: .center))
                .frame(width: 50, height: 50)
                .rotationEffect(.init(degrees: self.animate ? 360 : 0))
            Text(self.placeholder)
                .fontWeight(.bold)
        }
        .padding(.vertical, 25)
        .padding(.horizontal, 35)
        .background(BlurView())
        .cornerRadius(55)
        .onAppear {
            withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                self.animate.toggle()
            }
        }
    }
    
}
