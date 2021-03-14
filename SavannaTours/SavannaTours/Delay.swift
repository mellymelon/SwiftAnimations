//
//  Delay.swift
//  SavannaTours
//
//  Created by Yong Liang on 3/13/21.
//

import Foundation

func delay(seconds: TimeInterval, block: @escaping() -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: block)
}
