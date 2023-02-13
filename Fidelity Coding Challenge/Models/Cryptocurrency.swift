//
//  Cryptocurrency.swift
//  Fidelity Coding Challenge
//
//  Created by Difeng Chen on 2/13/23.
//

import Foundation

struct Cryptocurrency: Decodable, Identifiable {

    struct Quotes: Decodable {
        struct Quote: Decodable {
            let price: Double?
            let volume_24h: Double?
            let volume_24h_change_24h: Double?
            let market_cap: Double?
            let market_cap_change_24h: Double?
            let percent_change_15m: Double?
            let percent_change_30m: Double?
            let percent_change_1h: Double?
            let percent_change_6h: Double?
            let percent_change_12h: Double?
            let percent_change_24h: Double?
            let percent_change_7d: Double?
            let percent_change_30d: Double?
            let percent_change_1y: Double?
            let ath_price: Double?
            let ath_date: String?
            let percent_from_price_ath: Double?
        }

        let USD: Quote?
    }

    let id: String
    let name: String?
    let symbol: String?
    let rank: Double?
    let circulating_supply: Double?
    let total_supply: Double?
    let max_supply: Double?
    let beta_value: Double?
    let first_data_at: String?
    let last_updated: String?
    let quotes: Quotes?
}
