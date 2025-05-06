//
//  ActorDetailView.swift
//  ModoCine
//
//  Created by Fernando Moreno on 18/04/2025.
//

import SwiftUI

struct ActorDetailView: View {
    @ObservedObject var viewModel: ActorDetailViewModel
    let actorId: Int

    var body: some View {
        VStack {
            Capsule()
                .fill(Color.gray)
                .frame(width: 100, height: 10)
                .padding(.top, 4)
            if viewModel.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let error = viewModel.errorMessage {
                VStack(alignment: .center) {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                }
            } else if let actor = viewModel.actor, let castCredits = viewModel.castCredits {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {

                        // Imagen y nombre
                        VStack(alignment: .center) {
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(actor.profilePath)")) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                Color.gray.opacity(0.3)
                            }
                            .frame(width: 180, height: 240)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(radius: 6)
                            .padding(.top)

                            Text(actor.name)
                                .font(.title)
                                .bold()
                                .padding(.top, 8)
                        }
                        .frame(maxWidth: .infinity)

                        // Info principal
                        infoRow(title: "Conocido por", value: actor.knownForDepartment)
                        if let birthday = actor.birthday {
                            infoRow(title: "Fecha de nacimiento", value: formatBirthday(birthday, deathday: actor.deathday))
                        }
                        if let deathInfo = formatDeathday(actor.deathday, birthday: actor.birthday) {
                            infoRow(title: "Fallecido", value: deathInfo)
                        }
                        infoRow(title: "Lugar de nacimiento", value: actor.placeOfBirth)
                        infoRow(title: "Popularidad", value: String(format: "%.1f", actor.popularity))

                        // Otros nombres
                        if !actor.alsoKnownAs.isEmpty {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("También conocido como:")
                                    .font(.headline)
                                ForEach(actor.alsoKnownAs, id: \.self) { alias in
                                    Text("• \(alias)")
                                        .font(.subheadline)
                                }
                            }
                        }

                        // Redes sociales
                        if let externalIds = viewModel.externalIds {
                            if !externalIds.instagramId.isEmpty ||
                                !externalIds.twitterId.isEmpty ||
                                !externalIds.facebookId.isEmpty {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Redes sociales")
                                        .font(.headline)

                                    HStack(spacing: 16) {
                                        if !externalIds.instagramId.isEmpty {
                                            Link(destination: URL(string: "https://instagram.com/\(externalIds.instagramId)")!) {
                                                Image("instagram")
                                            }
                                        }
                                        if !externalIds.twitterId.isEmpty {
                                            Link(destination: URL(string: "https://twitter.com/\(externalIds.twitterId)")!) {
                                                Image("x")
                                            }
                                        }
                                        if !externalIds.facebookId.isEmpty {
                                            Link(destination: URL(string: "https://facebook.com/\(externalIds.facebookId)")!) {
                                                Image("facebook")
                                            }
                                        }
                                    }
                                    .font(.subheadline)
                                }
                            }
                        }

                        // Biografía
                        if !actor.biography.isEmpty {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Biografía")
                                    .font(.headline)
                                Text(actor.biography)
                                    .font(.body)
                                    .multilineTextAlignment(.leading)
                            }
                        }

                        // Películas / Créditos
                        if !castCredits.isEmpty {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Filmografía")
                                    .font(.headline)

                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 12) {
                                        ForEach(castCredits, id: \.creditId) { credit in
                                            VStack {
                                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(credit.posterPath ?? "")")) { image in
                                                    image
                                                        .resizable()
                                                        .scaledToFill()
                                                } placeholder: {
                                                    Color.gray.opacity(0.2)
                                                }
                                                .frame(width: 100, height: 150)
                                                .cornerRadius(8)
                                            }
                                        }
                                    }
                                }
                                .padding(.top, 4)
                            }
                        }

                    }
                    .padding()
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchActor(actorId: actorId)
                await viewModel.fetchExternalIds(actorId: actorId)
                await viewModel.fetchCastCredits(actorId: actorId)
            }
        }
    }

    @ViewBuilder
    private func infoRow(title: String, value: String) -> some View {
        HStack(alignment: .top) {
            Text("\(title):")
                .bold()
            Text(value)
        }
        .font(.subheadline)
    }
}
