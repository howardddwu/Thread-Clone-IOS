//
//  ProfileHeaderView.swift
//  Thread Clone
//
//  Created by Howard Wu on 10/28/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User?

    init(user: User?) {
        self.user = user
    }

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 16) {
                //  bio and stats
                VStack(alignment: .leading, spacing: 4) {
                    // fullname and username
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text(user?.username ?? "")
                        .font(.subheadline)
                }

                // avioding unnecessary empty space if no bio
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                }

                Text("2 followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()
            // Profile Image
            CircularProfileView()
        }
    }
}

#Preview {
    let dev = DeveloperPreview.shared
    ProfileHeaderView(user: dev.user)
}
