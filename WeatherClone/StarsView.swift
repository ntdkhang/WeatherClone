//
//  StarsView.swift
//  WeatherClone
//
//  Created by Nguyen Tran Duy Khang on 4/23/22.
//

import SwiftUI

struct StarsView: View {
	@State var starField = StarField()
    var body: some View {
		TimelineView(.animation) { timeline in
			Canvas { context, size in
				let timeInterval = timeline.date.timeIntervalSinceReferenceDate
				starField.update(with: timeline.date)
				context.addFilter(.blur(radius: 0.3))
				for (index, star) in starField.stars.enumerated() {
					let path = Path(ellipseIn: CGRect(x: star.x, y: star.y, width: star.size, height: star.size))
					
					if star.flickerInterval == 0 {
						// flashing star
						var flashLevel = sin(Double(index) + timeInterval * 2)
						flashLevel = abs(flashLevel) / 2    // make flashLevel to be in range 0->0.5
						context.opacity = 0.5 + flashLevel  // opacity in range 0.5->1
					} else {
						// blooming star
						var flashLevel = sin(Double(index) + timeInterval) * star.flickerInterval // in range -20 -> 20
						flashLevel -= (star.flickerInterval - 1) // in range -39->1
						
						if flashLevel > 0 {
							var contextCopy = context
							contextCopy.addFilter(.blur(radius: 3))

							contextCopy.fill(path, with: .color(white: 1))
							contextCopy.fill(path, with: .color(white: 1))
							contextCopy.fill(path, with: .color(white: 1))
						}
						context.opacity = 1 // so that blooming star don't get the opacity from previous flashing star
					}
					
					if index.isMultiple(of: 6) {
						context.fill(path, with: .color(red: 1, green: 0.8, blue: 0.75))
					} else {
						context.fill(path, with: .color(white: 1))
					}
				}
			}
		}
		.ignoresSafeArea()
		.mask(
			LinearGradient(colors: [.white, .clear], startPoint: .top, endPoint: .bottom)
		)
    }
}

struct StarsView_Previews: PreviewProvider {
    static var previews: some View {
        StarsView()
			.preferredColorScheme(.dark)
    }
}
