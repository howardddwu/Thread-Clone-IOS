//
//  UserService.swift
//  Thread Clone
//
//  Created by Howard Wu on 10/23/24.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore
import Foundation

class UserService {
    // makes currentUser observable to any subscriber. It will automatically notify views or view models when currentUser changes
    @Published var currentUser: User?
    
    // Singleton instance of 'UserService', ensuring there's only one instance shared throughout the app
    static let shared = UserService()
    
    init() {
        // 'Task' is used to run asynchronous code in an initializer.
        Task { try await self.fetchCurrentUser() }
    }
    
    // Fetches the current user from firestore. This function is annotated with @MainActor to ensure UI-related code runs on the main thread
    @MainActor
    func fetchCurrentUser() async throws {
        // Get the user ID from Firebase Auth ( Checking if the user has logged in)
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        // Fetch the user's document from Firestore using their user ID
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        
        // Convert the Firestore document into a 'User' object. This requires that the 'User' model conforms to the Codable protocol.
        let user = try snapshot.data(as: User.self)
        
        // Update the 'currentUser' property with the fetched user. Since 'currentUser' is published, this will notify any views or view models that are observing it
        self.currentUser = user
    }
    
    // Fetching all users from the Firestore database, excluding the current user
    static func fetchUsers() async throws -> [User] {
        // check if the current user id exists, if not, return an empty array
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        
        // Fetch all documents from the "users" collection in Firestore
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        
        // convert each document in the snapshot to a User object, ignoring any documents that cant be parsed as User
        let users = snapshot.documents.compactMap { try? $0.data(as: User.self) }
        
        // return the list of users, filtering out the current user by their unique ID
        return users.filter { $0.id != currentUid }
    }
    
    func reset() {
        self.currentUser = nil
    }
}
