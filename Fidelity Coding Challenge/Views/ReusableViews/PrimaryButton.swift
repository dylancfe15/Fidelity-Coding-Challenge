//
//  PrimaryButton.swift
//  Fidelity Coding Challenge
//
//  Created by Difeng Chen on 2/12/23.
//

import SwiftUI

struct PrimaryButton: View {

    var action: () -> Void
    var title: String
    var width: CGFloat?
    var height: CGFloat = 50
    var font = Font.body.bold()

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(font)
                .padding(.horizontal)
                .frame(width: width, height: height)
        }
            .background(Color.accentColor)
            .cornerRadius(height / 2)
            .foregroundColor(.white)
    }
}

struct PrimaryButton_Previews: PreviewProvider {

    static var previews: some View {
        PrimaryButton(action: { }, title: "+")
    }
}
