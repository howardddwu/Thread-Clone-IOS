//
//  ExploreView.swift
//  Thread Clone
//
//  Created by Howard Wu on 10/4/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(1 ... 10, id: \.self) { _ in
                        VStack {
                            UserCell()
                            Divider()
                        }
                        .padding(.vertical, 4)
                    }
                }
            }

            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search For Name")
        }
    }
}

#Preview {
    ExploreView()
}

