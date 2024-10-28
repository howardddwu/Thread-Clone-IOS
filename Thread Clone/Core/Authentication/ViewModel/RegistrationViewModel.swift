//
//  RegistrationViewModel.swift
//  Thread Clone
//
//  Created by Howard Wu on 10/20/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var registration_email = ""
    @Published var registration_password = ""
    @Published var registration_fullname = ""
    @Published var registration_username = ""

    @MainActor
    func createUser() async throws {
        print("DEBUG: Create user here...")
        try await AuthService.shared.createUser(
            withEmail: registration_email,
            password: registration_password,
            fullname: registration_fullname,
            username: registration_username)
    }
}
