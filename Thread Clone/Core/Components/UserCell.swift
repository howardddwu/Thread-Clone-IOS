//
//  UserCell.swift
//  Thread Clone
//
//  Created by Howard Wu on 10/5/24.
//

import SwiftUI

struct UserCell: View {
    let user: User
    var body: some View {
        HStack {
            CircularProfileView(user: user)
            VStack(alignment: .leading, spacing: 2) {
                Text(user.username)
                    .fontWeight(.semibold)
                Text(user.fullname)
            }
            .font(.footnote)

            Spacer()

            Button {
                print("following or now")
            } label: {
                Text("Follow")
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .frame(width: 100, height: 32)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    }
            }
        }
        .padding(.horizontal)
    }
}

// struct UserCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UserCell(user: dev.user)
//    }
// }
#Preview {
    let dev = DeveloperPreview.shared
    return UserCell(user: dev.user)
}
