//
//  ProfileView.swift
//  Thread Clone
//
//  Created by Howard Wu on 10/4/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation

    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 20
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 16) {
                        //  bio and stats
                        VStack(alignment: .leading, spacing: 4) {
                            // fullname and username
                            Text("Howard Wu")
                                .font(.title2)
                                .fontWeight(.semibold)

                            Text("Hi, my name is Hoawrd. I love playing video games during my free time!")
                                .font(.subheadline)
                        }
                        Text("Cats are evil...")
                            .font(.footnote)

                        Text("2 followers")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }

                    Spacer()
                    // Profile Image
                    CircularProfileView()
                }
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
                VStack {
                    HStack {
                        ForEach(ProfileThreadFilter.allCases) { filter in
                            VStack {
                                Text(filter.title)
                                    .font(.subheadline)
                                    .fontWeight(filter == selectedFilter ? .semibold : .regular)

                                if filter == selectedFilter {
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .frame(width: filterBarWidth, height: 1)
                                        .matchedGeometryEffect(id: "item", in: animation)
                                } else {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: filterBarWidth, height: 1)
                                }
                            }
                            .onTapGesture {
                                withAnimation {
                                    selectedFilter = filter
                                }
                            }
                        }
                    }
                    LazyVStack {
                        ForEach(0 ... 10, id: \.self) { _ in
                            ThreadCell()
                        }
                    }
                }
                .padding(.vertical, 8)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView()
}
