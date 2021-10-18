//
//  AlertView.swift
//  BusinessOrganization
//
//  Created by Wesley Levasseur on 15/02/2021.
//

import SwiftUI

//MARK: - AlertView
struct AlertView: View {
    
    var symbol: String
    var symbolColor: Color
    var title: String
    var titleColor: Color
    var description: String
    var buttons: [AlertButtonView]
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            VStack(spacing: 25) {
                Image(systemName: self.symbol)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(self.symbolColor)
                Text(self.title)
                    .font(.title)
                    .foregroundColor(self.titleColor)
                Text(self.description)
            }
            .padding(.vertical, 25)
            .padding(.horizontal, 30)
            .background(BlurView())
            .cornerRadius(55)
        }.padding()
    }
    
}

//MARK: - AlertButtonView
struct AlertButtonView: View {
    
    var text: String
    var color: Color
    var backgroundColor: Color
    var action: () -> ()
    
    var body: some View {
        Button(action: self.action) {
            Text(self.text)
                .foregroundColor(self.color)
                .fontWeight(.bold)
                .padding(.vertical, 10)
                .padding(.horizontal, 25)
                .background(self.backgroundColor)
                .clipShape(Capsule())
        }
    }
    
}
