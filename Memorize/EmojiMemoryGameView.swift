//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Lucas de Oliveira Souza on 14/02/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    let emojisHalloween: [String] = ["👻", "🕷️", "🧛🏻", "🍭", "🎃", "🧟", "🤡", "👻", "🕷️", "🧛🏻", "🍭", "🎃", "🧟", "🤡"]
    let emojisBeach: [String] = ["☀️", "⛱️", "🏝️", "🕶️", "🩳", "🌊", "🐚", "☀️", "⛱️", "🏝️", "🕶️", "🩳", "🌊", "🐚"]
    let emojisNight: [String] = ["🌝", "🌠", "🌚", "🌟", "✨", "🌙", "🌃", "🌝", "🌠", "🌚", "🌟", "✨", "🌙", "🌃"]
    
    @State var cardCount = 14
    @State var currentTheme: [String] = []
    
    var body: some View {
        VStack{
            Text("Memorize!").font(.largeTitle)
            ScrollView{
                cards(theme:  currentTheme)
            }
            Spacer()
            cardThemes
        }
        .padding()
        .onAppear {
            currentTheme = emojisHalloween
        }
    }
    
    func cards(theme: [String]) -> some View {
        let count = min(cardCount, theme.count)
        var arrayCopy = theme
        arrayCopy.shuffle()
        return LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]){
            ForEach(arrayCopy.indices, id: \.self){ index in
                CardView(content: arrayCopy[index])
                    .aspectRatio(1/2, contentMode: .fit)
            }
        }.foregroundColor(.orange)
    }

    
    var cardThemes: some View {
        HStack{
            cardThemeSwitch(emojiTheme: emojisHalloween, symbol: "ev.plug.dc.chademo", text: "Halloween")
            Spacer()
            cardThemeSwitch(emojiTheme: emojisBeach, symbol: "sun.min", text: "Sun")
            Spacer()
            cardThemeSwitch(emojiTheme: emojisNight, symbol: "moon", text: "Night")

        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardThemeSwitch(emojiTheme: [String], symbol: String, text: String) -> some View {
            Button( action: {
                currentTheme = emojiTheme
            }, label: {
                VStack {
                    Image(systemName: symbol).imageScale(.medium)
                    Text(text).font(.subheadline)
                }
            })
            
    }
        
}

struct CardView: View{
    let content: String
    @State var isFaceUp: Bool = false
    
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
        
    }
}

#Preview {
    EmojiMemoryGameView()
}
