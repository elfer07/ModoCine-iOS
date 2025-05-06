//
//  MovieGridItemView.swift
//  ModoCine
//
//  Created by Fernando Moreno on 17/04/2025.
//

import SwiftUI

struct MovieGridItemView: View {
    let posterPath: String?
    var onClick: () -> Void

    var body: some View {
        VStack {
            if let posterPath = posterPath {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 130, height: 170)
                .cornerRadius(10)
                .shadow(color: .white, radius: 3)
            }
        }
        .onTapGesture {
            onClick()
        }
        .frame(maxWidth: .infinity)
    }
}
