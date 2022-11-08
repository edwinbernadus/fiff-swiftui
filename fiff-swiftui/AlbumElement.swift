//
//  AlbumElement.swift
//  fiff-swiftui
//
//  Created by edwin on 09/11/22.
//

import Foundation


// MARK: - AlbumElement
struct AlbumElement: Codable,Hashable,Identifiable {
    let userID, id: Int
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title
    }
}

typealias Album = [AlbumElement]
