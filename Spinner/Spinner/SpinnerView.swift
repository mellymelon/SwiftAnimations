//
//  SpinnerView.swift
//  Spinner
//
//  Created by Yong Liang on 3/13/21.
//

import SwiftUI

struct SpinnerView: View {
    let leaves = 12
    let shootUp = AnyTransition.offset(CGSize(width: 0, height: -1000))
    @State var currentIndex: Int?
    @State var completed = false
    @State var visible = true
    @State var currentOffset = CGSize.zero //drag

    var body: some View {
        VStack {
            if visible {
                ZStack {
                    ForEach(0..<leaves) { i in
                        Leaf(rotation: Angle(degrees: Double(i) / Double(leaves)) * 360.0, isCurrent: i == currentIndex, completed: completed)
                    }
                }
                    .offset(currentOffset)
                    .blur(radius: currentOffset == .zero ? 0 : 10)
                    //.animation(.easeInOut(duration: 1.0))
                    .onAppear {
                        animate()
                    }
                    .transition(shootUp)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                currentOffset = gesture.translation
                            }
                            .onEnded { gesture in
                                if currentOffset.height > 150 {
                                    complete()
                                }
                                currentOffset = .zero
                        }
                    )
            }
        }
    }

    func animate() {
        var iteration = 0
        Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { timer in
            if let current = currentIndex {
                currentIndex = (current + 1) % leaves
            } else {
                currentIndex = 0
            }
            //20次(3s)就停止
            iteration += 1
            if iteration == 20 {
                timer.invalidate()
                complete()
            }
        }
    }

    func complete() {
        guard !completed else { return }
        completed = true
        currentIndex = nil //处理有片叶在收拢时向中间淡出
        delay(seconds: 2) {
            visible = false
        }
    }

    struct Leaf: View {
        let rotation: Angle
        let isCurrent: Bool
        let completed: Bool

        var body: some View {
            Capsule()
                .stroke(isCurrent ? Color.white : Color.gray, lineWidth: 8)
                .frame(width: 20, height: completed ? 20 : 50)
                .offset(x: isCurrent ? 10 : 0, y: isCurrent ? 40 : 70)
                .scaleEffect(isCurrent ? 0.5 : 1.0)
                .rotationEffect(completed ? .zero : rotation)
                .animation(.easeInOut(duration: 1.5))
        }
    }
}

struct SpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerView()
    }
}
