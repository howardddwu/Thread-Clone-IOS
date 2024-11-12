//
//  FeedCell.swift
//  Thread Clone
//
//  Created by Howard Wu on 10/4/24.
//

import SwiftUI

struct ThreadCell: View {
    let thread: Thread
    @ScaledMetric private var buttonsSizeWidthHeight: CGFloat = 20
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularProfileView(user: thread.user)
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 5) {
                        Text(thread.user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        Text(thread.timestamp.timestampString())
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))

                        Button {} label: {
                            Image(systemName: "ellipsis")
                        }
                        .padding(.trailing, 5)
                    }
                    Text(thread.caption)
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
    let dev = DeveloperPreview.shared.thread
    ThreadCell(thread: dev)
}
