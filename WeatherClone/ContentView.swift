//
//  ContentView.swift
//  WeatherClone
//
//  Created by Nguyen Tran Duy Khang on 4/21/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		ZStack {
			CloudsView(thickness: .regular)
		}
		.preferredColorScheme(.dark)
		.background(.blue)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
