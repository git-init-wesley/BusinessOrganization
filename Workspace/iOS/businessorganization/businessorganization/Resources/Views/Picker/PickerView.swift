//
//  Conçu avec ♡ par Levasseur Wesley.
//  © Copyright 2021. Tous droits réservés.
//
//  Création datant du 20/05/2021.
//

import SwiftUI

struct PickerView: View {

    @State private var filteredStrings: [String] = []
    @State private var filteredStrings_: [String] = []
    @State private var filteredStringValue: [String] = []
    @State private var filterString: String = ""
    @State private var frameHeight: CGFloat = 360

    var returnButtonTitle: String
    var description: String
    var furtherHeight: CGFloat = 0
    @Binding var strings: [String]
    @Binding var strings_: [String]?
    @Binding var stringsValue: [String]?
    var withSorted: Bool
    @Binding var returnValue: String
    @Binding var presented: Bool

    var addString: ((String) -> ())?

    var body: some View {
        let filterBinding = Binding<String>(
            get: { self.filterString },
            set: {
                self.filterString = $0
                self.updateStrings()
                self.setHeight()
            }
        )
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Button(action: { withAnimation { self.presented = false } }) {
                            Text(self.returnButtonTitle)
                        }
                        .padding(10)
                        Spacer(minLength: 0)
                        if let addString = addString {
                            Button(action: {
                                if !self.strings.contains(self.filterString) {
                                    addString(self.filterString)
                                }
                                self.returnValue = self.filterString
                                withAnimation {
                                    self.presented = false
                                }
                            }) {
                                Image(systemName: "plus.circle")
                                    .frame(width: 45)
                            }
                            .opacity(self.filterString.isEmpty ? 0.5 : 1)
                            .disabled(self.filterString.isEmpty)
                        }
                    }
                    .background(Color(UIColor.darkGray))
                    .foregroundColor(.white)
                    Text(self.description)
                        .font(.caption2)
                        .padding(.leading, 10)
                    TextField("Picker_filter_field".localized(), text: filterBinding)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding(5)
                        .padding(.horizontal, 5)
                        .background(Color.primary.colorInvert().opacity(self.filterString.isEmpty ? 0.5 : 0.8))
                        .cornerRadius(12)
                        .padding(5)
                        .padding(.horizontal)
                }
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        ForEach(0..<self.filteredStrings.count, id: \.self) { (index: Int) in
                            let string = self.filteredStrings[index]
                            let string_ = self.filteredStrings_[index]
                            let stringValue = self.filteredStringValue[index]
                            if string != "-NIL/" {
                                Group {
                                    Divider()
                                    Button(action: {
                                        self.returnValue = self.stringsValue != nil && stringValue !=  "-NIL/" ? stringValue : string
                                        withAnimation {
                                            self.presented = false
                                        }
                                    }) {
                                        HStack(spacing: 5) {
                                            if string_ != "-NIL/" {
                                                Text(string_)
                                            }
                                            Text(string)
                                        }
                                        .padding(2)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            } else if self.filteredStrings.count > 1 {
                                Divider()
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .frame(alignment: .center)
            }
            .background(BlurView())
            .cornerRadius(12)
            .frame(height: self.frameHeight)
        }
        .padding(UIScreen.main.bounds.height * 0.05)
        .onAppear {
            self.updateStrings()
            self.setHeight()
        }
        .onChange(of: self.strings, perform: { _ in
            self.updateStrings()
        })
        .background(BlurView().opacity(0.01).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height).ignoresSafeArea(.all, edges: .all).onTapGesture { withAnimation { self.presented = false } })
    }

    fileprivate func updateStrings() {
        var l1: [String] = [], l2: [String] = [], l3: [String] = []
        for i in 0..<self.strings.count {
            let v1: String = self.strings[i], v2: String = self.strings_ != nil && i <= self.strings_!.count - 1 ? self.strings_![i] : "-NIL/", v3: String = self.stringsValue != nil && i <= self.stringsValue!.count - 1 ? self.stringsValue![i] : "-NIL/"
            if self.filterString.isEmpty || v1.lowercased().starts(with: self.filterString.lowercased()) {
                l1.append(v1)
                l2.append(v2)
                l3.append(v3)
            }
        }
        l1.append("-NIL/")
        l2.append("-NIL/")
        l3.append("-NIL/")
        self.filteredStrings = l1
        self.filteredStrings_ = l2
        self.filteredStringValue = l3
    }

    fileprivate func setHeight() {
        withAnimation {
            switch self.filteredStrings.count - 1 {
            case 0:
                self.frameHeight = 115
            case 1:
                self.frameHeight = 155
                    //120+35
            case 2:
                self.frameHeight = 196
                    //120+35+35+6
            case 3:
                self.frameHeight = 237
                    //120+35+35+35+6+6
            case 4:
                self.frameHeight = 278
                    //120+35+35+35+35+6+6+6
            case 5:
                self.frameHeight = 319
                    //120+35+35+35+35+35+6+6+6+6
            default:
                self.frameHeight = 360
                    //120+35+35+35+35+35+35+6+6+6+6+6
            }
            self.frameHeight += self.furtherHeight
        }
    }

}
