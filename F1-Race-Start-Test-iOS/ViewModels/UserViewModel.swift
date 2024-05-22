//
//  UserViewModel.swift
//  F1 Race Start Test
//
//  Created by Florian DAVID on 01/12/2023.
//

import Foundation

enum UserState {
    case notAvailable
    case loading
    case success(data: Codable)
    case failure(error: Error)
}

class UserViewModel: ObservableObject {
    @Published var state: UserState = .notAvailable
    private let service = UserService()
    
    func signGoogle() async {
        state = .loading
        do {
            let user = try await service.fetchGoogleUserSign()
            state = .success(data: user)
        } catch {
            state = .failure(error: error)
        }
    }
}
