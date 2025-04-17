//
//  MoviePosterView.swift
//  ModoCine
//
//  Created by Fernando Moreno on 14/04/2025.
//

import SwiftUI

struct MoviePosterView: View {
    let imageUrl: URL?

    var body: some View {
        AsyncImage(url: imageUrl) { phase in
            switch phase {
            case .empty:
                Color.gray
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure:
                Color.red
            @unknown default:
                Color.gray
            }
        }
        .frame(width: 120, height: 170)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 6)
    }
}
