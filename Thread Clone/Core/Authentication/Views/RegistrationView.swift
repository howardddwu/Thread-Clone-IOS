//
//  RegistrationView.swift
//  Thread Clone
//
//  Created by Howard Wu on 10/1/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var registration_email = ""
    @State private var registration_password = ""
    @State private var registration_fullname = ""
    @State private var registration_username = ""
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
                TextField("Enter your email", text: $registration_email)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifier())
                SecureField("Enter your password", text: $registration_password)
                    .modifier(ThreadsTextFieldModifier())
                TextField("Enter your full name", text: $registration_fullname)
                    .modifier(ThreadsTextFieldModifier())
                TextField("Enter your username", text: $registration_username)
                    .modifier(ThreadsTextFieldModifier())
            }
            Button {
                print("Sign Up")
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
