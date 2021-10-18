//
//  SignInView.swift
//  BusinessOrganization
//
//  Created by Wesley Levasseur on 14/02/2021.
//

import SwiftUI

//MARK: - SignInView
struct SignInView: View {
    
    @EnvironmentObject var currentUser: BOUser
    @StateObject var model: SignInModel = SignInModel()
    @StateObject var alert: AuthAlertModel = AuthAlertModel()
    @State var secureAnimation: Bool = false
    @State var isPasswordInfoBoxPresented: Bool = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    Spacer(minLength: 0)
                    Image("Clipart-SignIn")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 0.8192 * UIScreen.main.bounds.width, height: 0.6584 * UIScreen.main.bounds.width, alignment: .center)
                        .padding(.horizontal, 35)
                        .padding(.vertical)
                    HStack {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("?".localized("connection"))
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            Text("?".localized("connection_desc"))
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
                            TextField("?".localized("email_address"), text: self.$model.emailAddress)
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
                        HStack {
                            Image(systemName: "lock")
                                .font(.title2)
                                .foregroundColor(.primary)
                                .frame(width: 35)
                            SecureField("?".localized("password"), text: self.$model.password)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                .foregroundColor(.primary)
                                .textContentType(.password)
                            Spacer(minLength: 0)
                            Button(action: { self.isPasswordInfoBoxPresented.toggle() }) {
                                Image(systemName: "info.circle")
                                    .font(.title2)
                                    .foregroundColor(Color.primary.opacity(self.isPasswordInfoBoxPresented ? 1 : 0.5))
                                    .frame(width: 35)
                            }
                        }
                        .padding()
                        .background(Color.primary.opacity(self.model.password.isEmpty ? 0.05 : 0.12))
                        .cornerRadius(55)
                        .padding(.horizontal)
                        ZStack {
                            Text("?".localized("password_format_info"))
                                .font(.subheadline)
                        }
                        .animation(.spring())
                        .frame(width: self.isPasswordInfoBoxPresented ? UIScreen.main.bounds.width - 30 : 0, height: self.isPasswordInfoBoxPresented ? 100 : 0)
                    }
                    Button(action: { /*self.signIn()*/        fatalError() }) {
                        Text("?".localized("sign_in"))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color.accentColor.opacity(self.model.isOneFieldsFromFormAreEmpty() ? 0.8 : 1))
                            .clipShape(Capsule())
                    }
                    .disabled(self.model.isOneFieldsFromFormAreEmpty())
                    .padding(.top)
                    NavigationLink(destination: ForgotPasswordView()) {
                        Text("?".localized("forgot_password_?"))
                            .font(.subheadline)
                            .foregroundColor(Color.accentColor)
                            .underline()
                    }
                    Spacer(minLength: 0)
                    HStack(spacing: 5) {
                        Text("?".localized("not_account_yet"))
                        NavigationLink(destination: SignUpView().environmentObject(self.currentUser)) {
                            Text("?".localized("sign_up"))
                                .fontWeight(.heavy).foregroundColor(Color.accentColor)
                        }
                    }
                    .font(.caption2)
                    .padding(.vertical)
                }
                .background(Color.primary.colorInvert().ignoresSafeArea(.all, edges: .all))
                .blur(radius: (self.model.progress || self.alert.isAuthAlertPresented) ? 3 : 0)
                .disabled(self.model.progress || self.alert.isAuthAlertPresented)
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

