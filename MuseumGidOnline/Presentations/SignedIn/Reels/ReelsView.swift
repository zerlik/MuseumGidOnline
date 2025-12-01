//
//  ReelsView.swift
//  MuseumGidOnline
//
//  Created by andrew on 01.12.25.
//

import SwiftUI

struct ReelsView<ViewModel: ReelsViewModelProtocol>: View {
    
    private let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    Text("Раздел «Рилсы»")
                        .font(.title2.weight(.semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("новости, видеоролики ")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 24)
                }
                .padding()
            }
            .navigationTitle("Рилсы")
            .navigationBarTitleDisplayMode(.large)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


