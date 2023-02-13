//
//  Tweet.swift
//  Fidelity Coding Challenge
//
//  Created by Difeng Chen on 2/13/23.
//

import Foundation

struct Tweet: Decodable {
    let date: String?
    let user_name: String?
    let user_image_link: String?
    let status: String?
    let is_retweet: Bool?
    let retweet_count: Int?
    let like_count: Int?
    let status_link: String?
    let status_id: String?
    let media_link: String?
    let youtube_link: String?
}
