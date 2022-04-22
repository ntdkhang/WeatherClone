//
//  Color-Interpolation.swift
//  WeatherClone
//
//  Created by Nguyen Tran Duy Khang on 4/22/22.
//

import SwiftUI

extension Color {
	func getComponents() -> (red: Double, green: Double, blue: Double, alpha: Double) {
		var red: CGFloat = 0
		var green: CGFloat = 0
		var blue: CGFloat = 0
		var alpha: CGFloat = 0
		
		let uiColor = UIColor(self)
		uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
		return (red, green, blue, alpha)
	}
	
	func interpolated(to destination: Color, amount: Double) -> Color {
		let componentsFrom = self.getComponents()
		let componentsTo = destination.getComponents()
		
		let newRed = (1 - amount) * componentsFrom.red + amount * componentsTo.red
		let newGreen = (1 - amount) * componentsFrom.green + amount * componentsTo.green
		let newBlue = (1 - amount) * componentsFrom.blue + amount * componentsTo.blue
		let newAlpha = (1 - amount) * componentsFrom.alpha + amount * componentsTo.alpha
		
		return Color(.displayP3, red: newRed, green: newGreen, blue: newBlue, opacity: newAlpha)

	}
}
