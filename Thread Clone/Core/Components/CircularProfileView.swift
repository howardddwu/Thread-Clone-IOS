//
//  CircularProfileView.swift
//  Thread Clone
//
//  Created by Howard Wu on 10/5/24.
//

import SwiftUI

struct CircularProfileView: View {
    var body: some View {
        Image("kaola")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(.circle)
    }
}

#Preview {
    CircularProfileView()
}
