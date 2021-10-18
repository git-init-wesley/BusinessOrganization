//
//  BOApp.swift
//  BusinessOrganization
//
//  Created by Wesley Levasseur on 31/03/2021.
//

import SwiftUI
import Firebase

//MARK: - BOApp
@main
struct BOApp: App {
    
    @StateObject var currentUser: BOUser = BOUser()
    @State var secureAnimation: Bool = false
    
    
    init() {
        FirebaseApp.configure()
        Auth.auth().languageCode = AppUtility.LOCALE_LANGUAGE_CODE
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack(alignment: .center) {
                PopupsView(
                    isPresented: self.$currentUser.isNetworkDesync,
                    popups: [
                        PopupView(
                            text: "?".localized(self.currentUser.networkDesyncUntil > 1 ? "popup_desync_plurial" : "popup_desync").replacingOccurrences(of: "{sec}", with: String(self.currentUser.networkDesyncUntil)),
                            backgroundColor: self.currentUser.networkStatusColor,
                            isPresented: self.$currentUser.isNetworkDesync
                        )
                    ]
                )
                .animation(.easeOut)
                Group {
                    if self.currentUser.isAuthentified {
                        BOMainView().opacity(self.currentUser.isAuthentified ? 1 : 0)
                    } else {
                        NavigationView {
                            SignInView().environmentObject(self.currentUser)
                        }.opacity(self.currentUser.isAuthentified ? 0 : 1)
                    }
                }
                .blur(radius: self.currentUser.isLoading ? 3 : 0)
                .disabled(self.currentUser.isLoading)
                .animation(self.secureAnimation ? .easeOut : .none)
                if self.currentUser.isLoading {
                    ProgressView(placeholder: self.currentUser.loadingText)
                        .ignoresSafeArea(.all, edges: .all)
                }
            }
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.secureAnimation = true
                }
            }
        }
    }
    
}
