//
//  CircularProfileView.swift
//  Thread Clone
//
//  Created by Howard Wu on 10/5/24.
//

import SwiftUI

struct CircularProfileView: View {
    var user: User?

    init(user: User?) {
        self.user = user
    }

    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            // load image
            AsyncImage(url: URL(string: imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(Color(.systemGray4))
        }
    }
}

#Preview {
    let dev = DeveloperPreview.shared.user
    CircularProfileView(user: dev)
}
