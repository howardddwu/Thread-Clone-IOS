//
//  RegistrationView.swift
//  Thread Clone
//
//  Created by Howard Wu on 10/1/24.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()

    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Spacer()
            Image("thread-app-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            VStack {
                TextField("Enter your email", text: $viewModel.registration_email)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifier())
                SecureField("Enter your password", text: $viewModel.registration_password)
                    .modifier(ThreadsTextFieldModifier())
                TextField("Enter your full name", text: $viewModel.registration_fullname)
                    .modifier(ThreadsTextFieldModifier())
                TextField("Enter your username", text: $viewModel.registration_username)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifier())
            }
            Button {
                Task { try await viewModel.createUser() }
            } label: {
                Text("Sign Up")
                    .modifier(ThreadsLogInButtonModifier())
            }
            Spacer()
            Divider()

            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
                .font(.footnote)
                .padding()
            }
        }
    }
}

#Preview {
    RegistrationView()
}
