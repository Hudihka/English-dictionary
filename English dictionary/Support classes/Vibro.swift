//
//  Vibro.swift
//  slavNeft
//
//  Created by Админ on 02.11.2020.
//  Copyright © 2020 AITIMegastar. All rights reserved.
//

import Foundation
import AudioToolbox

class Vibro: NSObject {
    static func strong() {
        AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
    }

    static func weak() {
        AudioServicesPlaySystemSound(1_520)
    }

}

