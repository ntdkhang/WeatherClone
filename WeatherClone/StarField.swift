//
//  StarField.swift
//  WeatherClone
//
//  Created by Nguyen Tran Duy Khang on 4/23/22.
//

import Foundation

class StarField {
	var stars = [Star]()
	let leftEdge = -50.0
	let rightEdge = 500.0
	var lastUpdated = Date.now
	
	init() {
		for _ in 1...200 {
			let x = Double.random(in: leftEdge...rightEdge)
			let y = Double.random(in: 0...600)
			let size = Double.random(in: 1...3)
			let star = Star(x: x, y: y, size: size)
			stars.append(star)
		}
	}
	
	func update(with date: Date) {
		let deltaTime = lastUpdated.timeIntervalSince(date)
		for star in stars {
			star.x -= deltaTime * 0.9
			if star.x > rightEdge {
				star.x = leftEdge
			}
		}
		lastUpdated = date
	}
	
}
