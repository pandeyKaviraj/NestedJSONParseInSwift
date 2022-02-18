//
//  JsonData.swift
//  listView
//
//  Created by helloKaviraj MBP on 18/02/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation


struct Welcome: Codable {
    let title: String?
    let user: [User]
    let labels: [Label]
}

// MARK: - WelcomeElement
struct WelcomeElement: Codable {
    let title: String
    let createdAt: Date
}

// MARK: - User
struct User: Codable {
    let login: String
    let id: Int
    let avatarURL: String

}

// MARK: - Label
struct Label: Codable {
    let id: Int
}
