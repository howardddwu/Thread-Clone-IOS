//
//  ExploreViewModel.swift
//  Thread Clone
//
//  Created by Howard Wu on 10/25/24.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()

    init() {
        Task { try await self.fetchUsers() }
    }

    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
