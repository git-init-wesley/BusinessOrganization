//
//  HomeView.swift
//  BusinessOrganization
//
//  Created by Wesley Levasseur on 31/03/2021.
//

import SwiftUI

struct HomeView: View {
    
    @State var currentTab: Int = 0
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .bottom) {
                Text("?")
                    .padding()
                    .frame(alignment: .leading)
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "gear")
                }
                .padding()
                .buttonStyle(PlainButtonStyle())
            }
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.1, alignment: .bottom)
            .background(Color.red.opacity(0.8))
            TabView(selection: self.$currentTab) {
                VStack(alignment: .center, spacing: 10) {
                    ButtonHomeView(title: "?".localized("clients")) {
                        self.currentTab = 1
                    }
                    
                    ButtonHomeView(title: "?".localized("providers")) {
                        
                    }
                    
                    ButtonHomeView(title: "?".localized("articles")) {
                        
                    }
                    
                    ButtonHomeView(title: "?".localized("quotes")) {
                        
                    }
                    
                    ButtonHomeView(title: "?".localized("invoices")) {
                        
                    }
                    
                    ButtonHomeView(title: "?".localized("purchase_orders")) {
                        
                    }
                }
                .tag(0)
                VStack {
                    Text("Test1")
                    Button(action: {self.currentTab = 0}) {
                        Text("Back")
                    }
                }
                .tag(1)
                VStack {
                    Text("Test1")
                    Button(action: {self.currentTab = 0}) {
                        Text("Back")
                    }
                }.tag(2)
                VStack {
                    Text("Test1")
                    Button(action: {self.currentTab = 0}) {
                        Text("Back")
                    }
                }.tag(3)
            }
            .tabViewStyle(PageTabViewStyle.init(indexDisplayMode: .never))
        }
        .animation(.easeOut)
        .edgesIgnoringSafeArea(.all)
    }
    
}

struct ButtonHomeView: View {
    
    var title: String
    var action: () -> ()
    
    var body: some View {
        Button(action: self.action) {
            Text(self.title)
                .padding()
        }
        .frame(width: UIScreen.main.bounds.width*0.5, alignment: .center)
        .foregroundColor(Color.white)
        .background(Color.red.opacity(0.8))
        .clipShape(Capsule())
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
    
}
