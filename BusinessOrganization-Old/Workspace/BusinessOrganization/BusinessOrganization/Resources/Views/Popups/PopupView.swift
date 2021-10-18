//
//  PopupView.swift
//  BusinessOrganization
//
//  Created by Wesley Levasseur on 31/03/2021.
//

import SwiftUI

//MARK: - PopupView
struct PopupView: View {
    
    var text: String
    var backgroundColor: Color
    @Binding var isPresented: Bool
    
    var body: some View {
        Text(self.text)
            .font(.system(size: 14))
            .fontWeight(.bold)
            .frame(width: UIScreen.main.bounds.width)
            .padding(3)
            .background(self.backgroundColor)
            .scaleEffect(self.isPresented ? 1 : 0)
    }
}
