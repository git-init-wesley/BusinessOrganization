//
//  PopupsView.swift
//  BusinessOrganization
//
//  Created by Wesley Levasseur on 31/03/2021.
//

import SwiftUI

//MARK: - PopupsView
struct PopupsView: View {
    
    @Binding var isPresented: Bool
    var popups: [PopupView]
    
    var body: some View {
        VStack {
            ForEach(0..<popups.count) { index in
                popups[index]
            }
        }
        .frame(width: UIScreen.main.bounds.width)
        .padding(.horizontal, 3)
        .scaleEffect(self.isPresented ? 1 : 0)
    }
}
