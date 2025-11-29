//
//  ListCardView.swift
//  MuseumGidOnline
//
//  Created by andrew on 25.11.25.
//

import SwiftUI
import Combine

struct ListCardView: View {
    @ObservedObject private var viewModel: ListCardsViewModel
    
    init(viewModel: ListCardsViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(1.5)
                } else {
                    List(viewModel.cities) { city in
                        CityRow(city: city) {
                            viewModel.goToNextScreen(city)
                        }
                        .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Города")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                viewModel.loadCities()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

private struct CityRow: View {
    let city: City
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack {
                Text(city.name)
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(.primary)
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 8)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

