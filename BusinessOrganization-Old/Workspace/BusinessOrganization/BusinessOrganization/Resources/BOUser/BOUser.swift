//
//  BOUser.swift
//  BusinessOrganization
//
//  Created by Wesley Levasseur on 31/03/2021.
//

import Foundation
import FirebaseAuth
import SwiftUI
import Network

//MARK: - BOUser
class BOUser: ObservableObject {
    
    init() {
        //self.observeNetwork()
        guard let currentUser: UserInfo = Auth.auth().currentUser else {
            self.isLoading = false
            return
        }
        //self.signIn(currentUser.uid)
        self.isLoading = false
    }
    
    //MARK: Generals
    @Published var isLoading: Bool = true
    @Published var loadingText: String = "?".localized("loading")
    @Published var isSignOutProcess: Bool = false
    
    //MARK: Authentification
    @Published var isAuthentified: Bool = false
    @Published var userUid: String?
    var authentificationObserver: AuthStateDidChangeListenerHandle?
    
    //MARK: Network
    @Published var networkStatus: NWPath.Status = .satisfied
    @Published var networkStatusColor: Color = .green
    @Published var networkStatusString: String = "?"
    @Published var networkDesyncUntil: Int = 20
    @Published var isNetworkSync: Bool = true
    @Published var isNetworkDesync: Bool = true
    let networkMonitor = NWPathMonitor()
    var networkDesyncObserver: UInt?
    
}
