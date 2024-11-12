//
//  ThreadService.swift
//  Thread Clone
//
//  Created by Howard Wu on 11/8/24.
//

import Firebase
import Foundation

enum ThreadService {
    static func uploadThreads(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }

    static func fetchThreads() async throws -> [Thread] {
        let snapshot = try await Firestore.firestore().collection("threads")
            .order(by: "timestamp", descending: true)
            .getDocuments()
        return snapshot.documents.compactMap { try? $0.data(as: Thread.self) }
    }

    static func fetchUserThreads(uid: String) async throws -> [Thread] {
        let snapshot = try await Firestore.firestore().collection("threads")
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments()
        return snapshot.documents.compactMap { try? $0.data(as: Thread.self) }
    }
}
