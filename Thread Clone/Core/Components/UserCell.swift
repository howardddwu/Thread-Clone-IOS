//
//  UserCell.swift
//  Thread Clone
//
//  Created by Howard Wu on 10/5/24.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            CircularProfileView()
            VStack(alignment: .leading) {
                Text("Kaola")
                    .fontWeight(.semibold)
                Text("Hi, I am an animal!")
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

#Preview {
    UserCell()
}
