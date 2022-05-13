//
//  WeatherDetailsView.swift
//  WeatherClone
//
//  Created by Nguyen Tran Duy Khang on 5/13/22.
//

import SwiftUI

struct WeatherDetailsView: View {
	let tintColor: Color
	let residueType: Storm.Contents
	let residueStrength: Double
    var body: some View {
		ScrollView {
			VStack(spacing: 0) {
				ResidueView(type: residueType, strength: residueStrength)
					.frame(height: 62)
					.offset(y: 30)
					.zIndex(1)
				
				RoundedRectangle(cornerRadius: 25)
					.fill(tintColor.opacity(0.25))
					.frame(height: 800)
					.background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 25))
					.padding(.horizontal, 20)
			}
			.padding(.top, 200)
		}
	}
}

