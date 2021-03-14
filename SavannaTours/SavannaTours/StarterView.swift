//
//  StarterView.swift
//  SavannaTours
//
//  Created by Yong Liang on 3/13/21.
//

import SwiftUI

struct StarterView: View {
    @State var currentOffset = 0

    var body: some View {
        ZStack {
            Circle()
                .scaleEffect(0.5)
                .foregroundColor(colors[currentOffset])
                .animation(.default)
                .offset(x: offsets[currentOffset].x, y: offsets[currentOffset].y)
        }.onAppear {
            for i in 1..<offsets.count {
                delay(seconds: Double(i)) {
                    currentOffset = i
                }
            }
        }
    }
}

let offsets = [
    CGPoint(x: 0, y: 0),
    CGPoint(x: 100, y: 0),
    CGPoint(x: 100, y: -100),
    CGPoint(x: -100, y: -100),
    CGPoint(x: -100, y: 0),
    CGPoint(x: 0, y: 0)
]

let colors = [
    Color.green,
    Color.blue,
    Color.red,
    Color.orange,
    Color.yellow,
    Color.green
]

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
    }
}
