//
//  Conçu avec ♡ par Levasseur Wesley.
//  © Copyright 2021. Tous droits réservés.
//
//  Création datant du 13/05/2021.
//

import SwiftUI

struct SignUpView: View {
    
    public static var TAG: Int = UUID().hashValue
    
    @Binding public var selection: Int
    @State private var pickerPresented: Bool = false
    @State private var secureAnimation: Bool = false
    @State private var securePickerAnimation: Bool = false
    @StateObject public var model: SignUpModel = SignUpModel()
    @ObservedObject public var user: User = User.shared()
    @ObservedObject public var alert: AuthAlert = AuthAlert.shared()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Image("Clipart-SignUp")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 0.8192 * UIScreen.main.bounds.width,
                           height: 0.5096 * UIScreen.main.bounds.width,
                           alignment: .center)
                    .padding(.horizontal, 35)
                    .padding(.vertical)
                HStack {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Registration".localized())
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Registration_Description".localized())
                            .opacity(0.5)
                    }
                    Spacer(minLength: 0)
                }
                .padding()
                .padding(.leading, 15)
                Group {
                    Group {
                        Text("General_informations".localized())
                            .font(.title2)
                            .fontWeight(.bold)
                        Divider()
                            .padding(.horizontal)
                            .frame(width: UIScreen.main.bounds.width * 0.8)
                            .offset(y: -5)
                        AuthTextFieldView("Email_address".localized(), text: self.$model.emailAddress, autocapitalization: .none, disableAutocorrection: true, keyboardType: .emailAddress, textContentType: .emailAddress, imageSystemName: "envelope", authButtonInformationFieldView: .none)
                        AuthSecureFieldView("Password".localized(), text: self.$model.password, autocapitalization: .none, disableAutocorrection: true, keyboardType: .default, textContentType: .newPassword, imageSystemName: "lock", authButtonInformationFieldView: AuthButtonInformationFieldView({
                            self.alert.newAlert("Information".localized(), description: "Password_format_info".localized(), imageSystemName: "info.circle", accentColor: .blue)
                        }))
                        AuthSecureFieldView("Password_confirmation".localized(), text: self.$model.password_confirmation, autocapitalization: .none, disableAutocorrection: true, keyboardType: .default, textContentType: .newPassword, imageSystemName: "lock", authButtonInformationFieldView: AuthButtonInformationFieldView({
                            self.alert.newAlert("Information".localized(), description: "Password_format_info".localized(), imageSystemName: "info.circle", accentColor: .blue)
                        }))
                    }
                    Group {
                        HStack(spacing: 5) {
                            Text("Type_of_account".localized())
                                .font(.title2)
                                .fontWeight(.bold)
                            Button(action: { self.alert.newAlert("Information".localized(), description: "Type_of_account_info".localized(), imageSystemName: "info.circle", accentColor: .blue) }) {
                                Image(systemName: "info.circle")
                                    .font(.title2)
                                    .foregroundColor(Color.primary.opacity(0.5))
                            }
                        }
                        Divider()
                            .padding(.horizontal)
                            .frame(width: UIScreen.main.bounds.width * 0.8)
                            .offset(y: -5)
                        HStack(spacing: 10) {
                            Button(action: {
                                withAnimation {
                                    self.model.userType = UserType.Particular
                                }
                            }) {
                                Text(UserType.Particular.rawValue.localized())
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 10)
                                    .frame(width: UIScreen.main.bounds.width * 0.4)
                                    .background(self.model.userType == UserType.Particular ? Color.red : Color.accentColor.opacity(self.model.userType == UserType.Business ? 0.5 : 1))
                                    .clipShape(Capsule())
                            }
                            .disabled(self.model.userType == UserType.Particular)
                            Button(action: {
                                withAnimation {
                                    self.model.userType = UserType.Business
                                }
                            }) {
                                Text(UserType.Business.rawValue.localized())
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 10)
                                    .frame(width: UIScreen.main.bounds.width * 0.4)
                                    .background(self.model.userType == UserType.Business ? Color.red : Color.accentColor.opacity(self.model.userType == UserType.Particular ? 0.5 : 1))
                                    .clipShape(Capsule())
                            }
                            .disabled(self.model.userType == UserType.Business)
                        }
                        .padding()
                        .background(Color.primary.opacity(self.model.userType != nil ? 0.05 : 0.12))
                        .cornerRadius(50)
                    }
                    if [UserType.Particular, UserType.Business].contains(self.model.userType) {
                        Group {
                            Text("Personal_informations".localized())
                                .font(.title2)
                                .fontWeight(.bold)
                            Divider()
                                .padding(.horizontal)
                                .frame(width: UIScreen.main.bounds.width * 0.8)
                                .offset(y: -5)
                            AuthTextFieldView("Family_name".localized(), text: self.$model.familyName, autocapitalization: .none, disableAutocorrection: true, keyboardType: .namePhonePad, textContentType: .familyName, imageSystemName: "person", authButtonInformationFieldView: .none)
                            AuthTextFieldView("Given_name".localized(), text: self.$model.givenName, autocapitalization: .none, disableAutocorrection: true, keyboardType: .namePhonePad, textContentType: .givenName, imageSystemName: "person", authButtonInformationFieldView: .none)
                            HStack(alignment: .center, spacing: 0) {
                                Button(action: {
                                    withAnimation {
                                        self.pickerPresented = true
                                    }
                                }) {
                                    Text("+\(self.model.phonePrefix)")
                                        .padding()
                                        .background(Color.primary.opacity(self.model.phonePrefix == "00" ? 0.05 : 0.12))
                                        .cornerRadius(50)
                                        .padding(.horizontal, 5)
                                        .offset(x: UIScreen.main.bounds.width * 0.03)
                                }
                                .buttonStyle(PlainButtonStyle())
                                AuthTextFieldView("Phone_number".localized(), text: self.$model.phone, autocapitalization: .none, disableAutocorrection: true, keyboardType: .phonePad, textContentType: .telephoneNumber, imageSystemName: "phone", authButtonInformationFieldView: .none)
                            }
                        }
                    }
                    /*
                     Email*
                     Password*
                     Confirm Password*
                     Type*
                     
                     - Commun:
                     
                     + Dénomination (String)*
                     
                     + Adresse (String)*
                     
                     + [Particular/Business]
                     
                     + Secteur d'Activité (Nom ou code APE)
                     
                     
                     
                     - Particular: (Aucune vérification)
                     
                     
                     
                     - Business: (Vérification des informations pour une cohérance)
                     
                     + SIREN/SIRET {Numéro (Int), RSC (String), Siège social/Etab. Secondaire ... (String) }*
                     
                     + Nom commercial
                     
                     + Forme juridique
                     
                     + Nb. d'établissement (Int)
                     
                     
                     */
                }
                Button(action: { /*self.signUp()*/ }) {
                    Text("Sign_up".localized())
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color.accentColor.opacity(self.model.isOneFieldsAreEmpty() ? 0.8 : 1))
                        .clipShape(Capsule())
                }
                .padding(.top)
                .disabled(self.model.isOneFieldsAreEmpty())
                HStack(spacing: 5) {
                    Text("Agree_terms_of_use".localized())
                    Button(action: {}) {
                        Text("See".localized())
                            .fontWeight(.heavy)
                            .foregroundColor(Color.accentColor)
                    }
                    .disabled(true)
                }
                .font(.subheadline)
                .padding(.vertical)
                Spacer(minLength: 0)
                HStack(spacing: 5) {
                    Text("Have_account_yet".localized())
                    Button(action: {
                        withAnimation {
                            self.selection = SignInView.TAG
                        }
                    }) {
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
        .disabled(self.pickerPresented)
        .blur(radius: self.pickerPresented ? 3.0 : 0)
        if self.pickerPresented {
            /*PickerView(
                returnButtonTitle: "Back".localized(),
                description: "Picker_base_description".localized(),
                strings: .constant(LegalCategoryStore.shared().legalsCategoryLevelOneName),
                strings_: .constant(.none),
                stringsValue: .constant(.none),
                withSorted: true,
                returnValue: self.$model.phone,
                presented: self.$pickerPresented
            )
            .ignoresSafeArea(.all, edges: .all)
            .scaleEffect(self.pickerPresented ? 1 : 0)
            .blur(radius: self.pickerPresented ? 0 : 3.0)*/
            PickerView(
                returnButtonTitle: "Back".localized(),
                description: "Picker_base_description".localized(),
                strings: .constant(CountryStore.getCountriesNamePhone()),
                strings_: .constant(CountryStore.getCountriesEmoji()),
                stringsValue: .constant(CountryStore.getCountriesPhone()),
                withSorted: true,
                returnValue: self.$model.phonePrefix,
                presented: self.$pickerPresented
            )
            .ignoresSafeArea(.all, edges: .all)
            .scaleEffect(self.pickerPresented ? 1 : 0)
            .blur(radius: self.pickerPresented ? 0 : 3.0)
        }
    }
}
