//
//  MovieCardView.swift
//  ModoCine
//
//  Created by Fernando Moreno on 13/04/2025.
//

import SwiftUI

struct MovieItemCardView: View {
    let posterPath: String?
    var onClick: () -> Void

    var body: some View {
        HStack(spacing: 16) {
            if let posterPath = posterPath {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")) { image in
                    image
                        .resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 80, height: 120)
                .cornerRadius(10)
                .shadow(color: .white, radius: 3)
                .onTapGesture {
                    onClick()
                }
            }
        }
        .padding(.vertical, 8)
    }
}
