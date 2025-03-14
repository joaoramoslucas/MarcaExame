//
//  ButtonView.swift
//  Vollmed
//
//  Created by Joao Lucas on 26/02/25.
//

import SwiftUI

enum ButtonType {
    case primary
    case cancel
}

struct ButtonView: View {
    var text: String
    var buttonType: ButtonType
    
    init(text: String, buttonType: ButtonType = .primary) {
        self.text = text
        self.buttonType = buttonType
    }
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(buttonType == .primary ? Color.accentColor : Color(.cancel))
            .cornerRadius(12)
            .padding(.top, 8)
    }
}

#Preview {
    ButtonView(text: "Agendar consulta")
}
