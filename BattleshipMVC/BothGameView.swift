//
//  BothGameView.swift
//  BattleshipMVC
//
//  Created by u0830932 on 3/20/17.
//  Copyright © 2017 u0830932. All rights reserved.
//

import UIKit

class BothGameView: UIView {
    private var _player1View: GameView? = nil
    private var _player2View: GameView? = nil
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        let stackView: UIStackView = UIStackView(frame: CGRect(x:0, y:0, width: frame.width, height: frame.height))
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(stackView)
        
        _player1View = GameView()
        _player1View?.frame = CGRect(x: 10.0,y:20.0,width: 300.0, height:300)
        _player1View?.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0)
        _player1View?.contentMode = .redraw
        stackView.addArrangedSubview(_player1View!)
        
        _player2View = GameView()
        _player2View?.frame = CGRect(x: 10.0,y:20.0,width: 300.0, height:300)
        _player2View?.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0)
        _player2View?.contentMode = .redraw
        stackView.addArrangedSubview(_player2View!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

