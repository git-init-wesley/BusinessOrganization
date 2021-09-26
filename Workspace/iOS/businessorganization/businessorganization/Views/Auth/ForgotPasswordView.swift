//
//  Conçu avec ♡ par Levasseur Wesley.
//  © Copyright 2021. Tous droits réservés.
//
//  Création datant du 13/05/2021.
//

import SwiftUI

struct ForgotPasswordView: View {

    public static var TAG: Int = UUID().hashValue

    @Binding public var selection: Int
    @State private var secureAnimation: Bool = false
    @StateObject public var model: ForgotPasswordModel = ForgotPasswordModel()
    @ObservedObject public var user: User = User.shared()
    @ObservedObject public var alert: AuthAlert = AuthAlert.shared()

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Image("Clipart-ForgotPassword")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 0.8192 * UIScreen.main.bounds.width,
                                height: 0.488 * UIScreen.main.bounds.width,
                                alignment: .center)
                        .padding(.horizontal, 35)
                        .padding(.vertical)
                HStack {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("ForgotPassword".localized())
                                .font(.title)
                                .fontWeight(.bold)
                        Text("ForgotPassword_Description".localized())
                                .opacity(0.5)
                    }
                    Spacer(minLength: 0)
                }
                        .padding()
                        .padding(.leading, 15)
                Group {
                    AuthTextFieldView("Email_address".localized(), text: self.$model.emailAddress, autocapitalization: .none, disableAutocorrection: true, keyboardType: .emailAddress, textContentType: .emailAddress, imageSystemName: "envelope", authButtonInformationFieldView: .none)
                }
                Button(action: { /*self.forgotPassword()*/ }) {
                    Text("Recovered".localized())
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color.accentColor.opacity(self.model.isOneFieldsAreEmpty() ? 0.8 : 1))
                            .clipShape(Capsule())
                }
                        .padding(.top)
                        .disabled(self.model.isOneFieldsAreEmpty())
                Spacer(minLength: 0)
                HStack(spacing: 5) {
                    Text("Have_account_yet".localized())
                    Button(action: { withAnimation {
                        self.selection = SignInView.TAG
                    } }) {
                        Text("Sign_in".localized())
                                .fontWeight(.heavy)
                                .foregroundColor(Color.accentColor)
                    }
                }
                        .font(.caption2)
                        .padding(.vertical)
            }
        }
                .animation(self.secureAnimation ? .easeInOut : .default)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        self.secureAnimation = true
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .background(Color.primary.colorInvert().ignoresSafeArea(.all, edges: .all))
    }

}
