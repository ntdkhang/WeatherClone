//
//  CloudsView.swift
//  WeatherClone
//
//  Created by Nguyen Tran Duy Khang on 4/21/22.
//

import SwiftUI

struct CloudsView: View {
	var cloudGroup: CloudGroup
	let topTint: Color
	let bottomTint: Color
	
    var body: some View {
		TimelineView(.animation) { timeline in
			Canvas { context, size in
				cloudGroup.update(date: timeline.date)
				context.opacity = cloudGroup.opacity
				
				// Create an array of resolved images to avoid redoing this step when drawing the same clouds
				// This will also provide the ability to customize the resolved image
				let resolvedImages = (0..<8).map { index -> GraphicsContext.ResolvedImage in
					let image = Image("cloud\(index)")
					var resolvedImage = context.resolve(image)
					resolvedImage.shading = .linearGradient(
						Gradient(colors: [topTint, bottomTint]),
						startPoint: .zero,
						endPoint: CGPoint(x: 0, y: resolvedImage.size.height))
					return resolvedImage
				}
				
				for cloud in cloudGroup.clouds {
					context.translateBy(x: cloud.position.x, y: cloud.position.y)
					context.scaleBy(x: cloud.scale, y: cloud.scale)
					
					context.draw(resolvedImages[cloud.imageNumber], at: .zero, anchor: .topLeading)
					
					context.transform = .identity
				}
			}
		}
		.ignoresSafeArea()
		.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
	
	init(thickness: Cloud.Thickness, topTint: Color, bottomTint: Color) {
		cloudGroup = CloudGroup(thickness: thickness)
		self.topTint = topTint
		self.bottomTint = bottomTint
	}
}

struct CloudsView_Previews: PreviewProvider {
    static var previews: some View {
		CloudsView(thickness: .regular, topTint: .white, bottomTint: .white)
			.preferredColorScheme(.dark)
			.background(.blue)
    }
}
