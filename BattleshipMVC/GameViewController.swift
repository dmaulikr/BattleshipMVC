//
//  GameViewController.swift
//  BattleshipMVC
//
//  Created by u0830932 on 3/16/17.
//  Copyright © 2017 u0830932. All rights reserved.
//

import UIKit

class GameViewController: UIViewController{
    private let _game: Game = Game()
    
    override func loadView() {
        view = GameView()
    }
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.red
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
                }
            }
        }
        gameView.tokens = viewTokens
        
    }
}
