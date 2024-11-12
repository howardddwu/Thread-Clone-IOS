//
//  EditProfileView.swift
//  Thread Clone
//
//  Created by Howard Wu on 10/15/24.
//

import PhotosUI
import SwiftUI

struct EditProfileView: View {
    let user: User
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])

                // Content
                VStack {
                    // Name and Profile Image
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            Text(user.fullname)
                        }
                        Spacer()
                        PhotosPicker(selection: $viewModel.selectedItem) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                CircularProfileView(user: user)
                            }
                        }
                    }

                    Divider()

                    // Bio
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        TextField("Enter your bio", text: $bio, axis: .vertical)
                    }

                    Divider()

                    // Link
                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)
                        TextField("Add Link...", text: $link)
                            .autocorrectionDisabled(true)
                    }

                    Divider()

                    // Private Profile
                    Toggle("Private Profile", isOn: $isPrivateProfile)
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .padding()
                .background(Color(.white))
                .cornerRadius(10)
                .shadow(color: Color(.systemGray4), radius: 5, x: 3, y: 3)
//                .overlay{
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(Color(.systemGray4), lineWidth: 1)
//                }
                .padding()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        Task { try await viewModel.updateUserData() }
                        dismiss()
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    let dev = DeveloperPreview().user
    EditProfileView(user: dev)
}
