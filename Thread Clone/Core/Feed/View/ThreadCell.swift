//
//  FeedCell.swift
//  Thread Clone
//
//  Created by Howard Wu on 10/4/24.
//

import SwiftUI

struct ThreadCell: View {
    @ScaledMetric private var buttonsSizeWidthHeight: CGFloat = 20
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularProfileView()
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 5) {
                        Text("Name of the user")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("10m")
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))

                        Button {} label: {
                            Image(systemName: "ellipsis")
                        }
                        .padding(.trailing, 5)
                    }
                    Text("Content of the thread")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)

                    HStack(spacing: 16) {
                        Button {} label: {
                            Image(systemName: "heart")
                                .resizable()
                                .frame(width: buttonsSizeWidthHeight, height: buttonsSizeWidthHeight)
                        }
                        Button {} label: {
                            Image(systemName: "bubble.right")
                                .resizable()
                                .frame(width: buttonsSizeWidthHeight, height: buttonsSizeWidthHeight)
                        }
                        Button {} label: {
                            Image(systemName: "arrow.rectanglepath")
                                .resizable()
                                .frame(width: buttonsSizeWidthHeight, height: buttonsSizeWidthHeight)
                        }
                        Button {} label: {
                            Image(systemName: "paperplane")
                                .resizable()
                                .frame(width: buttonsSizeWidthHeight, height: buttonsSizeWidthHeight)
                        }
                    }
                    .padding(.vertical, 8)
                    .foregroundColor(.black)
                }
            }
            Divider()
        }
        .padding()
    }
}

#Preview {
    ThreadCell()
}
