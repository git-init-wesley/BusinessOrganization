//
//  Conçu avec ♡ par Levasseur Wesley.
//  © Copyright 2021. Tous droits réservés.
//
//  Création datant du 19/05/2021.
//

import SwiftUI

struct AuthSecureFieldView: View {

    private var title: String
    private var text: Binding<String>
    private var autocapitalization: UITextAutocapitalizationType
    private var disableAutocorrection: Bool
    private var keyboardType: UIKeyboardType
    private var textContentType: UITextContentType
    private var imageSystemName: String
    private var authButtonInformationFieldView: AuthButtonInformationFieldView?

    init(_ title: String, text: Binding<String>, autocapitalization: UITextAutocapitalizationType, disableAutocorrection: Bool, keyboardType: UIKeyboardType, textContentType: UITextContentType, imageSystemName: String, authButtonInformationFieldView: AuthButtonInformationFieldView?) {
        self.title = title
        self.text = text
        self.autocapitalization = autocapitalization
        self.disableAutocorrection = disableAutocorrection
        self.keyboardType = keyboardType
        self.textContentType = textContentType
        self.imageSystemName = imageSystemName
        self.authButtonInformationFieldView = authButtonInformationFieldView
    }

    var body: some View {
        HStack {
            Image(systemName: self.imageSystemName)
                    .font(.title2)
                    .frame(width: 35)
            SecureField(self.title, text: self.text)
                    .autocapitalization(self.autocapitalization)
                    .disableAutocorrection(self.disableAutocorrection)
                    .keyboardType(self.keyboardType)
                    .textContentType(self.textContentType)
            if self.authButtonInformationFieldView != nil {
                self.authButtonInformationFieldView!
            }
        }
                .padding()
                .background(Color.primary.opacity(self.text.wrappedValue.isEmpty ? 0.05 : 0.12))
                .cornerRadius(50)
                .padding(.horizontal)
    }

}
