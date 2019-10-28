//
//  CardView.swift
//  Set_Lab_3
//
//  Created by Anique Davla on 10/28/19.
//  Copyright © 2019 Anique. All rights reserved.
//

import UIKit

class CardView: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        //draws a corned card
        drawCardOutline()
        
        //draw a Set squiggle
        drawSquiggle()
        
        //draws a oval for Set in the Card's View
        drawSetOval(x: frame.width, y: frame.height/3)
        
        //diamond's position in the Card's view
        var moveTo = CGPoint(x: frame.width/2, y: frame.height/3)
        var leftLine = CGPoint(x: (moveTo.x)/2, y: moveTo.y * 1.25)
        var downLine = CGPoint(x: moveTo.x, y: moveTo.y * 1.5)
        var rightLine = CGPoint(x: moveTo.x * 1.5, y: moveTo.y * 1.25)
        var upLine = CGPoint(x: moveTo.x, y: moveTo.y)
        drawDiamond(
            moveTo: moveTo,
            leftLine: leftLine,
            downLine: downLine,
            rightLine: rightLine,
            upLine: upLine)
    }
    
    
    
    //draws a rounded card
    func drawCardOutline(){
        //card outline
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 26.0)
        UIColor.white.setFill()
        roundedRect.addClip()
        roundedRect.fill()
    }
    //draws a Squiggle
    func drawSquiggle(){
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: frame.width/4, y: frame.height/1.5))
        path.addCurve(to: CGPoint(x: frame.width/1.2, y: frame.height/1.7),
                      controlPoint1: CGPoint(x: frame.width/2, y: frame.height/2.5),
                      controlPoint2: CGPoint(x: frame.width/2.5, y: frame.height/1.2))
        
        //        path.addQuadCurve(to: CGPoint(x: frame.width/1.8, y: frame.height/1.3),
        //                          controlPoint: CGPoint(x: frame.width/1.1, y: frame.height/1.2))
        path.addCurve(to: CGPoint(x: frame.width/1.8, y: frame.height/1.3),
                      controlPoint1: CGPoint(x: frame.width/1.1, y: frame.height/1.5),
                      controlPoint2: CGPoint(x: frame.width/1.1, y: frame.height/1.2))
        
        
        path.addCurve(to: CGPoint(x: frame.width/4, y: frame.height/1.505),
                      controlPoint1: CGPoint(x: frame.width/2.5, y: frame.height/1.5),
                      controlPoint2: CGPoint(x: frame.width/3.5, y: frame.height/1.04))
        UIColor.blue.setStroke()
        path.stroke()
    }
    //draws a Set Oval
    func drawSetOval(x: CGFloat, y: CGFloat){
        let arcCenter = CGPoint(x: x / 1.5, y: y / 2)
        let radius = bounds.height / 10
        
        //right side arc
        let rightArcStartAngle = CGFloat.pi/4
        let rightArcEndAngle = (7*CGFloat.pi)/4
        let rightArcPath = UIBezierPath(
            arcCenter: arcCenter,
            radius: radius,
            startAngle: rightArcStartAngle,
            endAngle: rightArcEndAngle,
            clockwise: false)
        let topLinePoint = CGPoint(x: radius * 2, y: (arcCenter.y - (radius / 1.4)))
        rightArcPath.addLine(to: topLinePoint)
        //        UIColor.red.setStroke()
        //        rightArcPath.addClip()
        //        rightArcPath.stroke()
        
        //left side arc
        let leftArcCenter = CGPoint(x: x / 3, y: y / 2)
        //let leftArcRadius = bounds.height / 4
        let leftArcStartAngle = 5 * CGFloat.pi/4
        let leftArcEndAngle = 3 * CGFloat.pi/4
        //        let leftArcPath = UIBezierPath(
        //                            arcCenter: leftArcCenter,
        //                            radius: leftArcRadius,
        //                            startAngle: leftArcStartAngle,
        //                            endAngle: leftArcEndAngle,
        //                            clockwise: true)
        //        UIColor.red.setStroke()
        //        leftArcPath.addClip()
        //        leftArcPath.stroke()
        rightArcPath.addArc(withCenter: leftArcCenter, radius: radius, startAngle: leftArcStartAngle, endAngle: leftArcEndAngle, clockwise: false)
        let bottomLine = CGPoint(x: radius * 5.7, y: (leftArcCenter.y + (radius / 1.4)))
        rightArcPath.addLine(to: bottomLine)
        UIColor.red.setStroke()
        //rightArcPath.addClip()
        rightArcPath.stroke()
    }
    
    //draws a triangle
    func drawDiamond(moveTo: CGPoint,leftLine: CGPoint, downLine: CGPoint, rightLine: CGPoint, upLine: CGPoint) {
        //triangle
        let triangle = UIBezierPath()
        triangle.move(to: moveTo)
        triangle.addLine(to: leftLine)
        triangle.addLine(to: downLine)
        triangle.addLine(to: rightLine)
        triangle.addLine(to: upLine)
        //        triangle.move(to: CGPoint(x: 40,y: 25))
        //        triangle.addLine(to: CGPoint(x: 23, y: 50))
        //        triangle.addLine(to: CGPoint(x: 40, y: 70))
        //        triangle.addLine(to: CGPoint(x: 55, y: 50))
        //        triangle.addLine(to: CGPoint(x: 40, y: 25))
        triangle.addClip()
        UIColor.green.setFill()
        triangle.fill()
        UIColor.black.setStroke()
        triangle.stroke()
    }
}

