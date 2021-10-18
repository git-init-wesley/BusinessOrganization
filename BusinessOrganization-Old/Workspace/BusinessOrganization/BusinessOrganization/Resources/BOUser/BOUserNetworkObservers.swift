//
//  BOUserNetworkObservers.swift
//  BusinessOrganization
//
//  Created by Wesley Levasseur on 03/04/2021.
//

import Foundation
import Network

//MARK: - BOUserNetworkObservers
extension BOUser {
    
    //MARK: - Network
    func observeNetwork() {
        if self.networkMonitor.queue == nil {
            self.networkMonitor.pathUpdateHandler = { (path: NWPath) in
                DispatchQueue.main.sync {
                    self.networkStatus = path.status
                }
                switch path.status {
                case .satisfied:
                    self.disobserveNetworkDesync()
                    DispatchQueue.main.sync {
                        self.isNetworkSync = true
                        self.isNetworkDesync = false
                        self.networkStatusString = "Syncro"
                        self.networkStatusColor = .green
                    }
                case .unsatisfied:
                    self.observeNetworkDesync()
                    DispatchQueue.main.sync {
                        self.isNetworkSync = false
                        self.isNetworkDesync = true
                        self.networkStatusString = "Desyncro"
                        self.networkStatusColor = .red
                    }
                case .requiresConnection:
                    DispatchQueue.main.sync {
                        self.isNetworkSync = false
                        self.isNetworkDesync = true
                        self.networkStatusString = "Syncro..."
                        self.networkStatusColor = .black
                    }
                default:
                    DispatchQueue.main.sync {
                        self.isNetworkSync = false
                        self.isNetworkDesync = true
                        self.networkStatusString = "?"
                        self.networkStatusColor = .black
                    }
                }
            }
            self.networkMonitor.start(queue: DispatchQueue.init(label: "networkMonitorObserver"))
        }
    }
    
    private func observeNetworkDesync() {
        if self.networkDesyncObserver == nil {
            self.networkDesyncObserver = 1
            self._observeNetworkDesync()
        }
    }
    
    private func _observeNetworkDesync() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            guard self.networkDesyncObserver != nil else {
                return
            }
            if self.networkDesyncUntil > 0 {
                self.networkDesyncUntil -= 1
            } else {
                //self.signOut()
            }
            self._observeNetworkDesync()
        }
    }
    
    private func disobserveNetworkDesync() {
        DispatchQueue.main.sync {
            self.networkDesyncObserver = .none
            self.networkDesyncUntil = 20
        }
    }
}

