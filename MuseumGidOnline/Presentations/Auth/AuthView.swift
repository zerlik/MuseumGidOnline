//
//  AuthView.swift
//  MuseumGidOnline
//
//  Created by andrew on 29.11.25.
//

import SwiftUI
import AuthenticationServices

struct AuthView: View {
    
    @ObservedObject var viewModel: AuthViewModel
    weak var presentingViewController: UIViewController?
    
    var body: some View {
        ZStack {
            // Background
            Color("blueBG")
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                Spacer()
                
                // Logo
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 200)
                    .padding(.horizontal, 40)
                
                Spacer()
                
                // Title
                VStack(spacing: 8) {
                    Text("Добро пожаловать")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.primary)
                    
                    Text("Войдите для продолжения")
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 16)
                
                // Sign in buttons
                VStack(spacing: 16) {
                    // Apple Sign In Button
                    SignInWithAppleButton(
                        onRequest: { request in
                            request.requestedScopes = [.fullName, .email]
                        },
                        onCompletion: { _ in
                            viewModel.signInWithAppleTapped()
                        }
                    )
                    .signInWithAppleButtonStyle(.black)
                    .frame(height: 50)
                    .cornerRadius(8)
                    .disabled(viewModel.isLoading)
                    
                    // Google Sign In Button
                    Button(action: {
                        if let vc = presentingViewController {
                            viewModel.signInWithGoogleTapped(presentingViewController: vc)
                        }
                    }) {
                        HStack(spacing: 12) {
                            Image(systemName: "g.circle.fill")
                                .font(.system(size: 20))
                            
                            Text("Войти через Google")
                                .font(.system(size: 17, weight: .semibold))
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                    }
                    .disabled(viewModel.isLoading)
                }
                .padding(.horizontal, 32)
                
                // Error message
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .font(.system(size: 14))
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 32)
                        .padding(.top, 8)
                }
                
                Spacer()
                
                // Privacy note
                Text("Нажимая кнопку входа, вы соглашаетесь с условиями использования и политикой конфиденциальности")
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 32)
            }
            
            // Loading indicator
            if viewModel.isLoading {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.5)
            }
        }
    }
}

#Preview {
    AuthView(
        viewModel: AuthViewModel(
            socialAuthService: SocialAuthService(),
            socialAuthClient: ApiClientSocialAuth(network: NetworkFetcher()),
            userSession: UserSession()
        ),
        presentingViewController: nil
    )
}



