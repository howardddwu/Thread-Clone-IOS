//
//  ThreadsTabView.swift
//  Thread Clone
//
//  Created by Howard Wu on 10/3/24.
//

import SwiftUI

struct ThreadsTabView: View {
    @State private var selectedTab = 0
    @State private var previousTab = 0
    @State private var showCreateThreadView = false

    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .onAppear {
                    previousTab = selectedTab
                    selectedTab = 0
                }
                .tag(0)
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .onAppear {
                    previousTab = selectedTab
                    selectedTab = 1
                }
                .tag(1)
            // Need to change it to a button in the future
            Color.clear
                .tabItem {
                    Image(systemName: "plus")
                }
                .onAppear {
                    selectedTab = 2
                }
                .tag(2)
            ActivityView()
                .tabItem {
                    Image(systemName: "heart")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
                .onAppear {
                    previousTab = selectedTab
                    selectedTab = 3
                }
                .tag(3)
            CurrentUserProfileView()
                .tabItem {
                    Image(systemName: "person")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                }
                .onAppear {
                    previousTab = selectedTab
                    selectedTab = 4
                }
                .tag(4)
        }
        .onChange(of: selectedTab) {
            showCreateThreadView = selectedTab == 2
        }
        .sheet(isPresented: $showCreateThreadView, onDismiss: {
            selectedTab = previousTab
            
        }, content: {
            CreateThreadView()
        })
        .tint(.black)
    }
}

#Preview {
    ThreadsTabView()
}
