//
//  GameViewController.swift
//  BattleshipMVC
//
//  Created by u0830932 on 3/16/17.
//  Copyright © 2017 u0830932. All rights reserved.
//

import UIKit

class GameViewController: UIViewController{
    private let _game: Game = Game(dictionary: [:])
    
    override func loadView() {
        view = GameView()
    }
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.red
        _game.setPiece(col: 0, row: 0, piece: "b")
        _game.setPiece(col: 0, row: 1, piece: "b")
        _game.setPiece(col: 0, row: 2, piece: "b")
        _game.setPiece(col: 0, row: 3, piece: "b")
        
        _game.setPiece(col: 5, row: 4, piece: "b")
        _game.setPiece(col: 5, row: 5, piece: "b")
        _game.setPiece(col: 5, row: 6, piece: "b")
        
        _game.setPiece(col: 3, row: 8, piece: "b")
        _game.setPiece(col: 4, row: 8, piece: "b")
        _game.setPiece(col: 5, row: 8, piece: "b")
        _game.setPiece(col: 6, row: 8, piece: "b")
        _game.setPiece(col: 7, row: 8, piece: "b")
        
        refresh()
    }
    
    var gameView: GameView{
        return view as! GameView
    }
    
    func refresh()
    {
        var viewTokens: [String] = []
        for boardCol: Int in 0 ..< _game.board.count
        {
            for boardRow:Int in 0 ..< _game.board[boardCol].count
            {
                let token: Game.Token = _game.board[boardCol][boardRow]
                switch token
                {
                case .none : viewTokens.append(" ")
                case .x : viewTokens.append("X")
                case .o : viewTokens.append("O")
                case .b : viewTokens.append("B")
                }
            }
        }
        gameView.tokens = viewTokens
        
    }
    
    
}
