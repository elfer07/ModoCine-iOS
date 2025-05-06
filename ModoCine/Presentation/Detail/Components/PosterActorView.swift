//
//  PosterActorView.swift
//  ModoCine
//
//  Created by Fernando Moreno on 14/04/2025.
//

import SwiftUI

struct PosterActorView: View {
    let imagePath: String?
    let name: String?
    let characterName: String?
    var onClick: () -> Void

    var body: some View {
        VStack {
            if let imagePath = imagePath {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(imagePath)")) { phase in
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
                .shadow(color: .white, radius: 6)
                .onTapGesture(perform: onClick)
            } else {
                Image(systemName: "photo.badge.exclamationmark")
                    .frame(width: 120, height: 170)
            }
            
            if let name = name {
                Text(name)
                    .font(.caption)
                    .bold()
                    .padding(.top, 4)
            }
            if let characterName = characterName {
                Text(characterName)
                    .font(.footnote)
                    .bold()
                    .padding(.top, 2)
            }
        }
    }
}
