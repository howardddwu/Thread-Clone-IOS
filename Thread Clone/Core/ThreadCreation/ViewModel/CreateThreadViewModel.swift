//
//  CreateThreadViewModel.swift
//  Thread Clone
//
//  Created by Howard Wu on 11/8/24.
//

import Firebase
import FirebaseAuth
import Foundation

class CreateThreadViewModel: ObservableObject {
    @Published var caption = ""

    func uploadThread() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThreads(thread)
    }
}
