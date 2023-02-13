//
//  DetailsNetworkManaging.swift
//  Fidelity Coding Challenge
//
//  Created by Difeng Chen on 2/13/23.
//

import Foundation

protocol DetailsNetworkManaging: NetworkManaging {
    func getTweets(for id: String, completion: @escaping(_ tweets: [Tweet]) -> Void)
}
