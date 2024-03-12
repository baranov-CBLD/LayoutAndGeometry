//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Kirill Baranov on 10/03/24.
//

import SwiftUI

struct ContentView: View {
	let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
	
	var body: some View {
		GeometryReader { fullView in
			ScrollView(.vertical) {
				ForEach(0..<50) { index in
					GeometryReader { proxy in
						Text("Row #\(index)")
							.font(.title)
							.frame(maxWidth: .infinity)
							.background {
								Color(hue: proxy.frame(in: .global).minY / fullView.size.height - 0.1, saturation: 1.0, brightness: 1.0)
							}
							.rotation3DEffect(.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
							.opacity((Double(proxy.frame(in: .global).minY / 200) - 0.001))
							.scaleEffect(min(1, Double(proxy.frame(in: .global).minY / fullView.size.height) + 0.1))
							.onTapGesture {
								print(min(1, Double(proxy.frame(in: .global).minY / fullView.size.height) + 0.1))
							}
					}
					.frame(height: 40)
				}
			}
		}
	}
}

#Preview {
	ContentView()
}
