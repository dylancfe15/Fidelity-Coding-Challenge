//
//  ConfigurationManager.swift
//  Fidelity Coding Challenge
//
//  Created by Difeng Chen on 2/13/23.
//

import Foundation

final class ConfigurationManager {
    enum Key: String {
        case baseURL = "Base URL"
    }

    static let shared = ConfigurationManager()

    var baseURL: String?

    init() {
        if let baseURL = getValue(for: .baseURL) as? String {
            self.baseURL = "https://\(baseURL)"
        }
    }

    private func getValue(for key: Key) -> Any? {
        Bundle.main.object(forInfoDictionaryKey: key.rawValue)
    }
}
