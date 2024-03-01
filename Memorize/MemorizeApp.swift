//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Lucas de Oliveira Souza on 14/02/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
