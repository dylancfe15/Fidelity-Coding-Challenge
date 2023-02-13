//
//  Color+Extension.swift
//  Fidelity Coding Challenge
//
//  Created by Difeng Chen on 2/12/23.
//

import SwiftUI

extension Color {

    enum Name: String {
        case white_background_color
    }

    init(name: Name) {
        self = Color(name.rawValue)
    }
}
