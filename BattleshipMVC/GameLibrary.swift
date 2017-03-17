//
//  GameLibrary.swift
//  BattleshipMVC
//
//  Created by u0830932 on 3/16/17.
//  Copyright © 2017 u0830932. All rights reserved.
//

import Foundation

class GameLibrary {
    
    public static let Instance: GameLibrary = GameLibrary()
    
    private init(){
        
    }
    
    private var _games: [Game] = []
    
    public var count: Int {
        return _games.count
    }
    
    public func createNewGame(){
        _games.append(Game(dictionary: [:]))
    }
    
    public func deleteGame(_ index: Int){
        _games.remove(at: index)
    }
    
    public func game(_ index: Int) -> Game {
        return _games[index]
    }
    
    public func load() {
        _games.removeAll()
        let jsonData: Data = try! Data(contentsOf: URL.init(fileURLWithPath: "/Users/Library.json"))
        let gameDictionaries: [NSDictionary] = try! JSONSerialization.jsonObject(with: jsonData, options: []) as! [NSDictionary]
        for gameDictionary: NSDictionary in gameDictionaries {
            let game: Game = Game(dictionary: gameDictionary)
            _games.append(game)
        }
    }
    
    public func save(){
        
        var gameDictionaries: [NSDictionary] = []
        for game: Game in _games {
            gameDictionaries.append(game.dictionaryRepresentation)
        }
        let jsonData: Data = try! JSONSerialization.data(withJSONObject: gameDictionaries, options: .prettyPrinted)
        try! jsonData.write(to: URL.init(fileURLWithPath: "/Users/Library.json"))
    }
}
