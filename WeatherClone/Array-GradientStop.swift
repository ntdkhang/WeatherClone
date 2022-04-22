//
//  Array-GradientStop.swift
//  WeatherClone
//
//  Created by Nguyen Tran Duy Khang on 4/22/22.
//

import SwiftUI

extension Array where Element == Gradient.Stop {
	func interpolated(amount: Double) -> Color {
		guard let initialStop = self.first else {
			fatalError("Cannot read from an empty array of Gradient stops")
		}
		
		var firstStop = initialStop
		var secondStop = initialStop
		
		for stop in self {
			if stop.location <= amount {
				firstStop = stop
			} else {
				secondStop = stop
				break
			}
		}
		
		if amount == firstStop.location {
			return firstStop.color.interpolated(to: secondStop.color, amount: 0)
		}
		
		let totalDiff = secondStop.location - firstStop.location
		let amountRelative = (amount - firstStop.location) / totalDiff
		
		return firstStop.color.interpolated(to: secondStop.color, amount: amountRelative)
	}
}
