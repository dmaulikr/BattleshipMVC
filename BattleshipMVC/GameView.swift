//
//  GameView.swift
//  BattleshipMVC
//
//  Created by u0830932 on 3/16/17.
//  Copyright © 2017 u0830932. All rights reserved.
//

import UIKit

class GameView: UIView {
    
    private var _gridRect: CGRect = CGRect.zero
    override func draw(_ rect: CGRect)
    {
        super.draw(rect)
        
        //Calculate Grid Rect
        var gridRect: CGRect = CGRect.zero
        let dimension: CGFloat = min(bounds.width, bounds.height)
        gridRect.size.width = dimension
        gridRect.size.height = dimension
        if(bounds.width < bounds.height){
            gridRect.origin.x = 0.0
            gridRect.origin.y = bounds.height * 0.5 - gridRect.size.width * 0.5
        }
        else {
            gridRect.origin.x = bounds.width * 0.5 - gridRect.size.width * 0.5
            gridRect.origin.y = 0.0
        }
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.addRect(gridRect)
        context.setFillColor((UIColor.cyan.cgColor))
        context.drawPath(using: .fill)
        
        //Draw Grid
        context.setLineWidth(dimension * 0.01)
        context.setStrokeColor(UIColor.darkGray.cgColor)
        
        var gridrow: CGFloat = 0
        while (gridrow < 11)
        {
            context.move(to: CGPoint(x: gridRect.minX + gridRect.width * 0.1 * gridrow, y: gridRect.minY))
            context.addLine(to: CGPoint(x: gridRect.minX + gridRect.width * 0.1 * gridrow, y: gridRect.maxY))
            context.drawPath(using: .stroke)

            context.move(to: CGPoint(x: gridRect.minX, y: gridRect.minY + gridRect.height * 0.1 * gridrow))
            context.addLine(to: CGPoint(x: gridRect.maxX, y: gridRect.minY + gridRect.height * 0.1 * gridrow))
            context.drawPath(using: .stroke)
            
            gridrow += 1
        }
        
        
        
        //Draw Game Tokens
        for tokenIndex: Int in 0 ..< min(100, tokens.count)
        {
            let token: NSString = tokens[tokenIndex] as NSString
            let tokenCol: Int = tokenIndex % 10
            let tokenRow: Int = tokenIndex / 10
            
            var tokenRect: CGRect = CGRect.zero
            tokenRect.size.width = gridRect.width * 0.1
            tokenRect.size.height = gridRect.height * 0.1
            tokenRect.origin.x = gridRect.minX + tokenRect.width * CGFloat(tokenCol)
            tokenRect.origin.y = gridRect.minY + tokenRect.height * CGFloat(tokenRow)
            
            let tokenTextAttributes: [String:Any] = [NSFontAttributeName:UIFont.boldSystemFont(ofSize: dimension * 0.05)]
            let tokenSize: CGSize = token.size(attributes: tokenTextAttributes)
            token.draw(at: CGPoint(x: tokenRect.midX - tokenSize.width * 0.5, y: tokenRect.midY - tokenSize.height * 0.5), withAttributes: tokenTextAttributes)
        }
        
        _gridRect = gridRect
    }
    
    public var tokens: [String] = []{
        didSet{
            setNeedsDisplay()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NSLog("touch")
        let touch:UITouch = touches.first!
        let touchPoint: CGPoint = touch.location(in: self)

    }
}
