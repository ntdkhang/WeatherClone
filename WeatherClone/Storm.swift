//
//  Storm.swift
//  WeatherClone
//
//  Created by Nguyen Tran Duy Khang on 4/24/22.
//

import SwiftUI

class Storm {
	enum Contents: CaseIterable {
		case none, rain, snow
	}
	
	var drops = [StormDrop]()
	var lastUpdated = Date.now
	var image: Image
	
	init(type: Contents, direction: Angle, strength: Int) {
		switch type {
		case .snow:
			image = Image("snow")
		default:
			image = Image("rain")
		}
		
		for _ in 0..<strength {
			drops.append(StormDrop(type: type, direction: direction + .degrees(90)))
		}
	}
	
	func update(date: Date, size: CGSize) {
		let delta = date.timeIntervalSince(lastUpdated)
		let screenRatio = size.height / size.width
		
		for drop in drops {
			let radian = drop.direction.radians
			
			drop.x += cos(radian) * drop.speed * delta * screenRatio
			drop.y += sin(radian) * drop.speed * delta 
			
			if drop.x < -0.2 {
				drop.x += 1.4
			}
			
			if drop.y > 1.2 {
				drop.x = Double.random(in: -0.2...1.2)
				drop.y -= 1.4
			}
		}
		
		lastUpdated = date
	}
}
