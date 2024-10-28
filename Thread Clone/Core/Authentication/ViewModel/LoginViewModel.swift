//
//  LoginViewModel.swift
//  Thread Clone
//
//  Created by Howard Wu on 10/20/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""

    @MainActor
    func login() async throws {
        print("DEBUG: User Logging in here...")
        try await AuthService.shared.login(
            withEmail: email,
            password: password)
    }
}
