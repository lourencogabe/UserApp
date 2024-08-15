//
//  UserModel.swift
//  UserApp
//
//  Created by Gabriel Lourenço on 14/08/24.
//

import Foundation

struct UserModel: Codable, Identifiable {
    let id: Int
    let name: String
    let age: Int
    let document: String
    let address: String
}
