//
//  DecreasingDrawer.swift
//  AdvancedPageControl
//
//  Created by Ксения Дураева on 30.07.2024.
//

import Foundation
import UIKit

public class DecreasingDrawer: AdvancedPageControlDrawerParentWithIndicator, AdvancedPageControlDraw {

    let endsDotScale: CGFloat = 0.5
    var centerScale: CGFloat = 0.3
    var visibleDots: Int = 5

    public func draw(_ rect: CGRect) {
        drawIndicators(rect)
    }

    func drawIndicators(_ rect: CGRect) {
        let centeredYPosition = getCenteredYPosition(rect, dotSize: height)
        let selectedIndex = Int(currentItem)

        var startIndex = max(0, selectedIndex - 2)
        var endIndex = min(numberOfPages - 1, startIndex + visibleDots - 1)

        if selectedIndex >= numberOfPages - 2 {
            startIndex = max(0, numberOfPages - visibleDots)
            endIndex = numberOfPages - 1
        }

        let totalWidth = (CGFloat(visibleDots) * width + CGFloat(visibleDots - 1) * space)
        let offsetX = (rect.width - totalWidth) / 2

        for index in startIndex...endIndex {
            let centeredX = offsetX + getCenterXPosition(rect, itemPos: CGFloat(index - startIndex), dotSize: width, space: space, numberOfPages: visibleDots)
            drawDot(at: index, centeredYPosition: centeredYPosition, centeredXPosition: centeredX, selectedIndex: selectedIndex, rect: rect, start: startIndex, last: endIndex)
        }
    }

    private func drawDot(at index: Int, centeredYPosition: CGFloat, centeredXPosition: CGFloat, selectedIndex: Int, rect: CGRect, start: Int, last: Int) {
        let color: UIColor = index == selectedIndex ? indicatorColor : dotsColor

        let isFirst = (index == start)
        let isLast = (index == last)

        var newScaledSize: (size: CGSize, yPosition: CGFloat) = (
            size: CGSize(width: self.width, height: self.height),
            yPosition: rect.origin.y + centeredYPosition
        )

        if currentItem <= 1 {
            newScaledSize = scaledSize(
                needScaled: index == last,
                centerYPos: centeredYPosition,
                rect: rect
            )
        } else if (Int(currentItem) >= (start + 1)) && (Int(currentItem) <= (last - 1)) {
            newScaledSize = scaledSize(
                needScaled: isFirst || isLast,
                centerYPos: centeredYPosition,
                rect: rect
            )
        } else if (currentItem >= CGFloat(last - 1)) {
            newScaledSize = scaledSize(
                needScaled: index == start,
                centerYPos: centeredYPosition,
                rect: rect
            )
        }

        drawItem(CGRect(x: centeredXPosition + rect.origin.x, y: newScaledSize.yPosition, width: newScaledSize.size.width, height: newScaledSize.size.height), raduis: radius, color: color)
    }

    private func scaledSize(needScaled: Bool, centerYPos: CGFloat, rect: CGRect) -> (size: CGSize, yPosition: CGFloat) {
        if needScaled {
            return (
                size: .init(
                    width: self.width * endsDotScale,
                    height: self.height * endsDotScale
                ),
                yPosition: rect.origin.y + centerYPos + (height * endsDotScale) / 2
            )
        } else {
            return (size: .init(width: self.width, height: self.height), yPosition: rect.origin.y + centerYPos)
        }
    }

    private func getCenterXPosition(_ rect: CGRect, itemPos: CGFloat, dotSize: CGFloat, space: CGFloat, numberOfPages: Int) -> CGFloat {
        return itemPos * (dotSize + space)
    }
}
