//
//  ProfileView.swift
//  Thread Clone
//
//  Created by Howard Wu on 10/4/24.
//

import SwiftUI

struct ProfileView: View {
    let user: User

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)
                Button {
                    print("clicking follow")
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .frame(width: 350, height: 32)
                        .background(.black)
                        .cornerRadius(10)
                }

                // User content list view
                UserContentListView(user: user)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    let dev = DeveloperPreview.shared
    return ProfileView(user: dev.user)
}
