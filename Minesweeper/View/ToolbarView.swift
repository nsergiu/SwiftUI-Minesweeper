//
//  ToolbarView.swift
//  Minesweeper
//
//  Created by Adrian-Sergiu Nicuta on 06/12/2020.
//

import SwiftUI

extension Color {
    static var redmondBackground = Color(white: 0.78)
    static var redmondShadow = Color(white: 0.55)
}

struct RedmondButtonStyle: ButtonStyle {
    @State var lineWidth: CGFloat = 2

    func makeBody(configuration: Self.Configuration) -> some View {
        let offset = configuration.isPressed ? lineWidth : 0
        return configuration.label
            .offset(x: offset, y: offset).animation(nil)
            .background(
                ZStack {
                    Corner(style: configuration.isPressed ? .topLeft : .bottomRight).stroke(Color.redmondShadow, lineWidth: lineWidth).padding(lineWidth)
                    Corner(style: configuration.isPressed ? .bottomRight : .topLeft).stroke(Color.white, lineWidth: lineWidth)
                    Corner(style: configuration.isPressed ? .topLeft : .bottomRight).stroke(Color.black, lineWidth: lineWidth)
                }
                .animation(nil)
            )
    }
}

struct Corner: Shape {
    enum Style { case topLeft, bottomRight }

    @State var style: Style

    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: rect.size.height))
            path.addLine(to: style == .topLeft ? .zero : CGPoint(x: rect.size.width, y: rect.size.height))
            path.addLine(to: CGPoint(x: rect.size.width, y: 0))
        }
    }
}

struct ToolbarView: View {
    @EnvironmentObject var game: Game
    
    var body: some View {
        HStack {
            Spacer()
            Text("\(game.hiddenBombs)")
                .frame(minWidth: 36, idealWidth: 48, maxWidth: 64, minHeight: 22, idealHeight: 24, maxHeight: 28, alignment: .trailing)
                .foregroundColor(.red)
                .background(Color.black)
                .font(.custom("digital-7", size: 28))
            Spacer()
            Button( action: {
                game.reset()
            }) {
                Image(systemName: "smiley.fill")
                    .resizable(capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4), resizingMode: .stretch)
                    .frame(width: 32, height: 32, alignment: .center)
                    .foregroundColor(.yellow)
            }
            .frame(width: 48, height: 48, alignment: .center)
            .buttonStyle(RedmondButtonStyle())
            Spacer()
            Text("\(game.time)")
                .frame(minWidth: 36, idealWidth: 48, maxWidth: 64, minHeight: 22, idealHeight: 24, maxHeight: 28, alignment: .trailing)
                .foregroundColor(.red)
                .background(Color.black)
                .font(.custom("digital-7", size: 28))
            Spacer()
        }
        .background(
            ZStack {
                Corner(style: .bottomRight).stroke(Color.redmondShadow, lineWidth: 2).padding(2)
                Corner(style: .topLeft).stroke(Color.white, lineWidth: 2)
                Corner(style: .bottomRight).stroke(Color.black, lineWidth: 2)
            }
            .background(Color.redmondBackground)
        )
    }
}

struct ToolbarView_Previews: PreviewProvider {
    private static var gameSettings = GameSettings()
    static var previews: some View {
        ToolbarView()
            .environmentObject(Game(from: gameSettings))
    }
}
