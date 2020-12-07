//
//  FeedItem.swift
//  Youtube
//
//  Created by Mayank Gandhi on 12/6/20.
//

import Foundation

struct FeedItem: Hashable, Identifiable {
    let id = UUID()
    let title: String
    let channelTitle: String
    let views: String
    let postedAt: String
    
    var timeStamp: String {
        return "\(postedAt) yrs ago"
    }
    
    
    static let data = [
        FeedItem(title: "Google Nexus 5X Review", channelTitle: "Marques Brownlee", views: "2.1M", postedAt: "1"),
        FeedItem(title: "6 Straight Men vs 1 Secret Lesbian", channelTitle: "Jubilee", views: "0.2M", postedAt: "2"),
        FeedItem(title: "Playboi Carti \"EARFQUAKE\" ", channelTitle: "Cherdleys", views: "2M", postedAt: "10"),
        FeedItem(title: "Highest in the Room - Travis Scott", channelTitle: "Travis Scott", views: "2.1M", postedAt: "20")]
}

