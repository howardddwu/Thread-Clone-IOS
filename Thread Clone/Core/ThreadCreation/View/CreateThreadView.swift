//
//  ThreadCreationView.swift
//  Thread Clone
//
//  Created by Howard Wu on 10/4/24.
//

import SwiftUI

struct CreateThreadView: View {
    @StateObject var viewModel = CreateThreadViewModel()
    @Environment(\.dismiss) var dismiss

    private var user: User? {
        return UserService.shared.currentUser
    }

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    CircularProfileView(user: user)
                    VStack(alignment: .leading) {
                        Text(user?.username ?? "Name of User")
                        TextField("Start a thread...", text: $viewModel.caption, axis: .vertical)
                    }
                    .font(.footnote)

                    Spacer()

                    if !viewModel.caption.isEmpty {
                        Button {
                            viewModel.caption = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding()

                Spacer()
            }
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .fontWeight(.semibold)
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button("Post") {
                        Task { try await viewModel.uploadThread() }
                        dismiss()
                    }
                    .opacity(viewModel.caption.isEmpty ? 0.5 : 1.0)
                    .disabled(viewModel.caption.isEmpty)
                    .fontWeight(.semibold)
                }
            }
            .font(.subheadline)
            .foregroundColor(.black)
        }
    }
}

#Preview {
    CreateThreadView()
}
