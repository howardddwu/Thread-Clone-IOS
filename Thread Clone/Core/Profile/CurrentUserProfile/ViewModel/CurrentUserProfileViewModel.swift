//
//  ProfileViewModel.swift
//  Thread Clone
//
//  Created by Howard Wu on 10/23/24.
//

import Foundation

import Combine

// ProfileViewModel conforms to ObservableObject, alling SwiftUI views to observe it
class CurrentUserProfileViewModel: ObservableObject {
    // @published makes currentUser observable, so changes trigger view updates automatically
    @Published var currentUser: User?

    // A set to hold the Combine subscriptions (Cancellables) to avoid memory leaks
    private var cancellables = Set<AnyCancellable>()

    init() {
        // Call the setup function to start observing UserService updates
        setupSubscribers()
    }

    // This function subscribes to changes in the UserService's currentUser and updates the currentUser in the viewModel
    private func setupSubscribers() {
        // Subscribe to the published 'currentUser' from UserService (using Combine framework)
        UserService.shared.$currentUser.sink { [weak self] user in
            // Use 'weak self' to prevent string reference cycles (memory leaks)
            self?.currentUser = user // Update the currentUser in the ViewModel when UserService changes
        }.store(in: &cancellables) // Store the subscription in 'cancellables' to automatically cancel it when the ViewModel is deallocated
    }
}
