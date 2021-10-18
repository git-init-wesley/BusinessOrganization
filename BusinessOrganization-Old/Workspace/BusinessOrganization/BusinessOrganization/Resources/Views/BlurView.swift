//
//  BlurView.swift
//  BusinessOrganization
//
//  Created by Wesley Levasseur on 31/03/2021.
//

import SwiftUI

//MARK: - BlurView
struct BlurView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial))
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
    
}
