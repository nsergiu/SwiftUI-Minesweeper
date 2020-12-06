//
//  MinesweeperApp.swift
//  Minesweeper
//
//  Created by Brandon Baars on 10/11/20.
//

import SwiftUI

@main
struct MinesweeperApp: App {
    var game = Game(from: GameSettings())

    var body: some Scene {
        WindowGroup {
            VStack {
                ToolbarView()
                BoardView()
            }
            .environmentObject(game)
        }
    }
}

struct MinesweeperApp_Preview : PreviewProvider {
    private static var game = Game(from:GameSettings())
    static var previews : some View {
        VStack {
            ToolbarView()
            BoardView()
        }
        .environmentObject(game)
    }
}
