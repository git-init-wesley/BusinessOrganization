//
//  ForgotPasswordView.swift
//  FastMMO
//
//  Created by Wesley Levasseur on 15/02/2021.
//

import SwiftUI

//MARK: - ForgotPasswordView
struct ForgotPasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @StateObject var model: ForgotPasswordModel = ForgotPasswordModel()
    @StateObject var alert: AuthAlertModel = AuthAlertModel()
    @State var secureAnimation: Bool = false
    @State var isPasswordInfoBoxPresented: Bool = false
    @State var isUsernameInfoBoxPresented: Bool = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    Spacer(minLength: 0)
                    Image("Clipart-ForgotPassword")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 0.8192 * UIScreen.main.bounds.width, height: 0.488 * UIScreen.main.bounds.width, alignment: .center)
                        .padding(.horizontal, 35)
                        .padding(.vertical)
                    HStack {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Récupération")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            Text("Vous avez oublié votre mot de passe ?")
                                .foregroundColor(Color.primary.opacity(0.5))
                        }
                        Spacer(minLength: 0)
                    }
                    .padding()
                    .padding(.leading, 15)
                    Group {
                        HStack {
                            Image(systemName: "envelope")
                                .font(.title2)
                                .foregroundColor(.primary)
                                .frame(width: 35)
                            TextField("Adresse mail", text: self.$model.emailAddress)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                .foregroundColor(.primary)
                                .keyboardType(.emailAddress)
                                .textContentType(.emailAddress)
                        }
                        .padding()
                        .background(Color.primary.opacity(self.model.emailAddress.isEmpty ? 0.05 : 0.12))
                        .cornerRadius(55)
                        .padding(.horizontal)
                    }
                    Button(action: { /*self.forgotPassword()*/ }) {
                        Text("Récupérer")
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color.accentColor.opacity(self.model.isOneFieldsFromFormAreEmpty() ? 0.8 : 1))
                            .clipShape(Capsule())
                    }
                    .disabled(self.model.isOneFieldsFromFormAreEmpty())
                    .padding(.top)
                    Spacer(minLength: 0)
                    HStack(spacing: 5) {
                        Text("Vous vous souvenez de votre mot de passe ?")
                        Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                            Text("Se connecter")
                                .fontWeight(.heavy)
                                .foregroundColor(Color.accentColor)
                        }
                    }
                    .font(.caption2)
                    .padding(.vertical)
                }
                .background(Color.primary.colorInvert().ignoresSafeArea(.all, edges: .all))
                .blur(radius: self.model.progress ? 3 : 0)
                .disabled(self.model.progress)
                .animation(self.secureAnimation ? .easeOut : .none)
            }
            /*if self.alert.isAuthAlertPresented {
             AuthAlertView(symbol: self.alert.authAlertSymbol, accentColor: self.alert.authAlertAccentColor, title: self.alert.authAlertTitle, description: self.alert.authAlertDescription, show: self.$alert.isAuthAlertPresented)
             .ignoresSafeArea(.all, edges: .all)
             .animation(self.secureAnimation ? .easeOut : .none)
             }*/
        }
        .navigationBarHidden(true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.secureAnimation = true
            }
        }
    }
    
}
