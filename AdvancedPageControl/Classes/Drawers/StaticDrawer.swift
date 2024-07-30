//
//  StaticDrawer.swift
//  AdvancedPageControl
//
//  Created by Ксения Дураева on 30.07.2024.
//

import Foundation
import UIKit

public class StaticDrawer:AdvancedPageControlDrawerParentWithIndicator, AdvancedPageControlDraw {

    var scaleFactor:CGFloat = 8

    public func draw(_ rect: CGRect) {
        drawIndicators(rect)
    }

    func drawIndicators(_ rect: CGRect) {
        for i in 0..<numberOfPages{

            let centeredYPosition = getCenteredYPosition(rect, dotSize: height)
            let y =  rect.origin.y + centeredYPosition
            let x = getCenteredXPosition(rect,itemPos: CGFloat(i), dotSize: width, space: space, numberOfPages: numberOfPages)
            if Int(floor(currentItem)) != i {
                drawItem(
                    CGRect(x: x, y:  y, width: width, height: height),
                    raduis: radius,
                    color: dotsColor,
                    borderWidth: borderWidth,
                    borderColor: borderColor,
                    index: i
                )
            } else {
                drawItem(
                    CGRect(x: x, y: y, width: width, height: height),
                    raduis: radius,
                    color: indicatorColor,
                    borderWidth: borderWidth,
                    borderColor: borderColor,
                    index: i
                )
            }
        }
    }
}
