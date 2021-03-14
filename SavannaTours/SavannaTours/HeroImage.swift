//
//  HeroImage.swift
//  SavannaTours
//
//  Created by Yong Liang on 3/13/21.
//

import SwiftUI

struct HeroImage: View {
    let name: String

    var body: some View {
        Image(name)
            .resizable()
            .edgesIgnoringSafeArea(.top)
            .frame(height: 300)
    }
}

struct HeroImage_Previews: PreviewProvider {
    static var previews: some View {
        HeroImage(name: "hero")
    }
}
