//
//  EditProfileView.swift
//  Thread Clone
//
//  Created by Howard Wu on 10/15/24.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
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
                            Text("Howard Wu")
                        }
                        Spacer()
                        CircularProfileView()
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
                    Button("Cancel") {}
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {}
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
