//
//  ActorDetailViewModel.swift
//  ModoCine
//
//  Created by Fernando Moreno on 18/04/2025.
//

import Foundation

@MainActor
class ActorDetailViewModel: ObservableObject {
    @Published var actor: DetailActor?
    @Published var externalIds: ExternalIdsActor?
    @Published var castCredits: [CastCreditsByActor]?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let fetchActorByIdUseCase: FetchActorByIdUseCase
    private let fetchExternalIdsUseCase: FetchExternalIdsUseCase
    private let fetchCastActorByIdUseCase: FetchCastActorByIdUseCase
    
    init(fetchActorByIdUseCase: FetchActorByIdUseCase, fetchExternalIdsUseCase: FetchExternalIdsUseCase, fetchCastActorByIdUseCase: FetchCastActorByIdUseCase) {
        self.fetchActorByIdUseCase = fetchActorByIdUseCase
        self.fetchExternalIdsUseCase = fetchExternalIdsUseCase
        self.fetchCastActorByIdUseCase = fetchCastActorByIdUseCase
    }
    
    func fetchActor(actorId: Int) async {
        isLoading = true
        errorMessage = nil
        
        do {
            actor = try await fetchActorByIdUseCase.execute(actorId: actorId)
            print("actor viewmodel: \(String(describing: actor?.name))")
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            print("error actorviewmodel: \(error.localizedDescription)")
            isLoading = false
        }
        
        isLoading = false
    }
    
    func fetchExternalIds(actorId: Int) async {
        isLoading = true
        errorMessage = nil
        
        do {
            externalIds = try await fetchExternalIdsUseCase.execute(actorId: actorId)
            print("external ids viewmodel: \(String(describing: externalIds))")
            isLoading = false
        } catch {
            errorMessage = "Error en fetchExternalIds \(error.localizedDescription)"
            isLoading = false
        }
        
        isLoading = false
    }
    
    func fetchCastCredits(actorId: Int) async {
        isLoading = true
        errorMessage = nil
        
        do {
            castCredits = try await fetchCastActorByIdUseCase.execute(actorId: actorId)
            print("cantidad de pelis viewmodel: \(castCredits?.count ?? 0)")
            isLoading = false
        } catch {
            errorMessage = "Error en fetchCastCredits \(error.localizedDescription)"
            isLoading = false
        }
        isLoading = false
    }
}
