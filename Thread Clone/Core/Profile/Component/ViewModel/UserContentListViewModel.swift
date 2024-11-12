//
//  UserContentListViewModel.swift
//  Thread Clone
//
//  Created by Howard Wu on 11/11/24.
//

import Foundation

class UserContentListViewModel: ObservableObject {
    @Published var threads = [Thread]()

    let user: User

    init(user: User) {
        self.user = user
        Task { try await fetchUserThreads() }
    }

    @MainActor
    func fetchUserThreads() async throws {
        var threads = try await ThreadService.fetchUserThreads(uid: user.id)

        for i in 0 ..< threads.count {
            threads[i].user = user
        }
        self.threads = threads
    }
}
