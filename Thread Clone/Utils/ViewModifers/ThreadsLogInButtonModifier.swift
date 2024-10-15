//
//  ThreadsLogInButtonModifier.swift
//  Thread Clone
//
//  Created by Howard Wu on 10/3/24.
//

import SwiftUI

struct ThreadsLogInButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 350, height: 44)
            .background(.black)
            .cornerRadius(10)
            .padding()
    }
}
