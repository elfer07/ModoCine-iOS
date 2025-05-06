//
//  IntroPageMovies.swift
//  ModoCine
//
//  Created by Fernando Moreno on 17/04/2025.
//

import SwiftUI

struct IntroPageMovies: View {
    var cards: [Card]
    @Binding var activeCard: Card?
    @State private var scrollPosition: ScrollPosition = .init()
    @State private var currentScrollOffset: CGFloat = 0
    @State private var timer = Timer.publish(every: 0.01, on: .current, in: .default).autoconnect()
    @State private var initialAnimation = false
    @State private var titleProgress = 0.0
    @State private var scrollPhase: ScrollPhase = .idle
    
    var onClick: (Int) -> Void
    var onNavigateToSearch: () -> Void
    var onNavigateToSearchTv: () -> Void
    
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                InfiniteScrollView(content: {
                    ForEach(cards) { card in
                        CarouselCardView(card)
                    }
                })
                .scrollIndicators(.hidden)
                .scrollPosition($scrollPosition)
                .scrollClipDisabled()
                .containerRelativeFrame(.vertical) { value, _ in
                    value * 0.45
                }
                .onScrollPhaseChange { oldPhase, newPhase in
                    scrollPhase = newPhase
                }
                .onScrollGeometryChange(for: CGFloat.self) {
                    $0.contentOffset.x + $0.contentInsets.leading
                } action: { oldValue, newValue in
                    currentScrollOffset = newValue
                    
                    if scrollPhase != .decelerating || scrollPhase != .animating {
                        let activeIndex = Int((currentScrollOffset / 220).rounded()) % cards.count
                        activeCard = cards[activeIndex]
                        
                    }
                }
                .visualEffect { [initialAnimation] content, proxy in
                    content
                        .offset(y: !initialAnimation ? -(proxy.size.height + 200) : 0)
                }
                
                VStack(spacing: 4) {
                    Text("ModoCine")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                        .textRenderer(TitleTextRenderer(progress: titleProgress))
                        .padding(.bottom, 12)
                    
                    HStack {
                        Text("Buscar")
                            .padding(4)
                            .background(.quaternary, in: .rect(cornerRadius: 20))
                            .font(.callout)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white.secondary)
                            .onTapGesture {
                                onNavigateToSearch()
                            }
                            .blurOpacityeffect(initialAnimation)
                        
                        Text("Series")
                            .padding(4)
                            .background(.quaternary, in: .rect(cornerRadius: 20))
                            .font(.callout)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white.secondary)
                            .onTapGesture {
                                onNavigateToSearchTv()
                            }
                            .blurOpacityeffect(initialAnimation)
                    }
                }
            }
            .safeAreaPadding(15)
        }
        .onReceive(timer) { _ in
            currentScrollOffset += 0.35
            scrollPosition.scrollTo(x: currentScrollOffset)
        }
        .task {
            activeCard = cards.first
            
            try? await Task.sleep(for: .seconds(0.35))
            
            withAnimation(.smooth(duration: 0.75, extraBounce: 0)) {
                initialAnimation = true
            }
            
            withAnimation(.smooth(duration: 2.5, extraBounce: 0)) {
                titleProgress = 1
            }
        }
    }
    
    
    
    // carousel card view
    @ViewBuilder
    private func CarouselCardView(_ card: Card) -> some View {
        GeometryReader {
            let size = $0.size
            
            AsyncImage(url: URL(string: card.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .clipShape(.rect(cornerRadius: 20))
                    .shadow(color: .black.opacity(0.4), radius: 10, x: 1, y: 0)
            } placeholder: {
                Color.gray
            }
                
        }
        .frame(width: 220)
        .scrollTransition(.interactive.threshold(.centered), axis: .horizontal) { content, phase in
            content
                .offset(y: phase == .identity ? -10 : 0)
                .rotationEffect(.degrees(phase.value * 5), anchor: .bottom)
            
        }
        .onTapGesture {
            onClick(card.id)
        }
    }
}

extension View {
    func blurOpacityeffect(_ show: Bool) -> some View {
        self
            .blur(radius: show ? 0 : 2)
            .opacity(show ? 1 : 0)
            .scaleEffect(show ? 1: 0.9)
    }
}
