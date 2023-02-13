//
//  ListNetworkManaging.swift
//  Fidelity Coding Challenge
//
//  Created by Difeng Chen on 2/13/23.
//

import Foundation

protocol ListNetworkManaging: NetworkManaging {
    func getCryptocurrencies(completion: @escaping(_ cryptocurrencies: [Cryptocurrency]) -> Void)
}
