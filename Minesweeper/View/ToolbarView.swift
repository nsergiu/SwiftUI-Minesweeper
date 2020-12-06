//
//  ToolbarView.swift
//  Minesweeper
//
//  Created by Adrian-Sergiu Nicuta on 06/12/2020.
//

import SwiftUI

struct ToolbarView: View {
    @EnvironmentObject var game: Game
    
    var body: some View {
        HStack {
            Text("\(game.hiddenBombs)")
            Button("reset") {
                game.reset()
            }
            Text("\(game.time)")
        }
    }
}

struct ToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarView()
    }
}
