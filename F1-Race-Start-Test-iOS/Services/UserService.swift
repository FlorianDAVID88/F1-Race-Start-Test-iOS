//
//  UserService.swift
//  F1 Race Start Test
//
//  Created by Florian DAVID on 01/12/2023.
//

import Foundation
import UIKit

struct User: Codable {
    let _id: String
    let username: String
    let profilePicture: URL?
    let connectedWith: String
    let email: String
    let accountCreationDate: String
}

enum UserError: Error {
    case failed
    case failedToDecode
    case invalideStatusCode
    case invalidURL
}

struct UserService {
    func fetchGoogleUserSign() async throws -> User {
        let url = "https://api-f1-race-start.vercel.app/users/auth/google?api_key=GUCySPX-r5i6-CEF0tVSu137c94_x_BoLf-F5OR9"
        
        guard let url = URL(string: url) else {
            throw UserError.invalidURL
        }
        
        await UIApplication.shared.open(url)
        
        /*let (data, resp) = try await URLSession.shared.data(from: url)
        
        guard let response = resp as? HTTPURLResponse, response.statusCode == 200 else {
            throw UserError.invalideStatusCode
        }
        
        let decodedData = try JSONDecoder().decode(JWTUser.self, from: data)
        return decodedData.user*/
        return User(_id: "11", username: "", profilePicture: nil, connectedWith: "", email: "", accountCreationDate: "")
    }
}

private struct JWTUser: Decodable {
    let accessToken: String
    let user: User
}
