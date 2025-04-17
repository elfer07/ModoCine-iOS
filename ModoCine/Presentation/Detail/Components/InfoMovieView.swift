//
//  ActionButton.swift
//  ModoCine
//
//  Created by Fernando Moreno on 14/04/2025.
//

import SwiftUI
import UIKit

struct InfoMovieView: View {
    let iconName: String
    let title: String

    var body: some View {
        HStack {
            Image(systemName: iconName)
                .resizable()
                .frame(width: 24, height: 24)

            Text(title)
                .font(.caption)
        }
    }
}
