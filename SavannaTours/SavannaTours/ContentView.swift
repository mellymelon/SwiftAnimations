//
//  ContentView.swift
//  SavannaTours
//
//  Created by Yong Liang on 3/13/21.
//

import SwiftUI

struct ContentView: View {
    @State var zoomed = false

    var body: some View {
        VStack(spacing: 0) {
            HeroImage(name: "hero")

            ZStack {
                HStack {
                    TourTitle(title: "Savanna Trek", caption: "15 mile drive followed by an hour long trek")
                        .offset(x: zoomed ? 500 : 0, y: -15)
                        .animation(.default)
                        .padding(.leading, 30)

                    Spacer()
                }

                GeometryReader { g in
                    Image("thumb")
                        .clipShape(RoundedRectangle(cornerRadius: zoomed ? 40 : 500))
                        .overlay(Circle().fill(zoomed ? Color.clear : Color.white.opacity(0.4)).scaleEffect(0.8))
                        .saturation(zoomed ? 1 : 0)
                        .rotationEffect(zoomed ? Angle(degrees: 0) : Angle(degrees: 90))
                        .position(x: zoomed ? g.frame(in: .local).midX : 600, y: 50)
                        .scaleEffect(zoomed ? 1.33 : 0.33)
                        .shadow(radius: 10)
                        .animation(.spring())
                        .onTapGesture {
                            zoomed.toggle()
                    }
                }
            }
                .background(Color(red: 0.1, green: 0.1, blue: 0.1))

            MilestonesList()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
