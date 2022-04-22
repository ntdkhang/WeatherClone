//
//  Cloud.swift
//  WeatherClone
//
//  Created by Nguyen Tran Duy Khang on 4/21/22.
//

import SwiftUI

class Cloud {
	enum Thickness: String, CaseIterable {
		case none, thin, light, regular, thick, ultra
	}
	
	var position: CGPoint
	let imageNumber: Int
	let speed = Double.random(in: 3...13)
	let scale: Double
	
	init(imageNumber: Int, scale: Double) {
		self.imageNumber = imageNumber
		self.scale = scale
		
		let startX = Double.random(in: -400...400)
		let startY = Double.random(in: -50...200)
		position = CGPoint(x: startX, y: startY)
	}
	
}
