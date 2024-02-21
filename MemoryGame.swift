//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Lucas de Oliveira Souza on 19/02/24.
//

import Foundation

struct MemoryGame<CardContent> {
    
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
    
}
