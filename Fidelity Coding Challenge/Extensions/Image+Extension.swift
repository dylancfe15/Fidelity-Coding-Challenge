//
//  Image+Extension.swift
//  Fidelity Coding Challenge
//
//  Created by Difeng Chen on 2/13/23.
//

import SwiftUI

extension Image {

    enum Name: String {
        case shake_hand
        case welcome_background
        case twitter
    }

    init(name: Name) {
        self.init(name.rawValue)
    }
}
