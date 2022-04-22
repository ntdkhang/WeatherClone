//
//  CloudGroup.swift
//  WeatherClone
//
//  Created by Nguyen Tran Duy Khang on 4/21/22.
//

import Foundation

class CloudGroup {
	var clouds = [Cloud]()
	let opacity: Double
	var lastUpdate = Date.now
	
	init(thickness: Cloud.Thickness) {
		let numberOfClouds: Int
		let cloudScale: ClosedRange<Double>
		switch thickness {
		case .none:
			numberOfClouds = 0
			opacity = 1
			cloudScale = 1...1
			
		case .thin:
			numberOfClouds = 10
			opacity = 0.6
			cloudScale = 0.2...0.4
			
		case .light:
			numberOfClouds = 10
			opacity = 0.7
			cloudScale = 0.4...0.6
			
		case .regular:
			numberOfClouds = 15
			opacity = 0.8
			cloudScale = 0.7...0.9
			
		case .thick:
			numberOfClouds = 25
			opacity = 0.9
			cloudScale = 1...1.3
			
		case .ultra:
			numberOfClouds = 40
			opacity = 1
			cloudScale = 1.2...1.6
		}
		
		for i in 0..<numberOfClouds {
			let imageNumber = i % 8
			let scale = Double.random(in: cloudScale)
			
			let cloud = Cloud(imageNumber: imageNumber, scale: scale)
			clouds.append(cloud)
		}
			
	}
	
	func update(date: Date) {
		let timeDelta = date.timeIntervalSince(lastUpdate)
		for cloud in clouds {
			cloud.position.x -= timeDelta * cloud.speed
			
			let offScreenDistance = max(400, 400 * cloud.scale)
			
			if cloud.position.x < -offScreenDistance {
				cloud.position.x = offScreenDistance
			}
		}
		lastUpdate = Date.now
	}
}
