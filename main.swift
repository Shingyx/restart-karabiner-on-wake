#!/usr/bin/swift

//
//  main.swift
//  restart-karabiner-on-wake
//
//  Created by Su-Shing Chen on 18/03/20.
//  Copyright © 2020 Su-Shing Chen. All rights reserved.
//

import Cocoa
import Foundation

func restartKarabiner() {
    let task = Process()
    let username = NSUserName()
    task.launchPath = "/usr/bin/pkill"
    task.arguments = ["-u", username, "-f", "/Library/Application Support/org.pqrs/Karabiner-Elements/bin/*"]
    task.launch()
    task.waitUntilExit()
    print("\(Date()) restartKarabiner result: \(task.terminationStatus)")
}

let dnc = DistributedNotificationCenter.default()

dnc.addObserver(forName: .init("com.apple.screenIsUnlocked"), object: nil, queue: .main) { _ in
    restartKarabiner()
}

print("restart-karabiner-on-wake initialized")

RunLoop.current.run()

print("restart-karabiner-on-wake exiting")
