//
//  SettingseManager.swift
//  slavNeft
//
//  Created by Александр Нейфельд on 30.06.2020.
//  Copyright © 2020 AITIMegastar. All rights reserved.
//

import UIKit

class DefaultUtils: NSObject {
    
    private enum Keys: String {
        case hideTranslate          = "hide_translate"
        case slectedSertchIndex     = "slected_sertch_index"
	
    }

    
    static let shared = DefaultUtils()
    
    private func obj(forKey: Keys) -> Any? {
        return UserDefaults.standard.object(forKey: forKey.rawValue)
    }
    
    
    private func bool(forKey: Keys) -> Bool {
        return UserDefaults.standard.bool(forKey: forKey.rawValue)
    }
	
    private func int(forKey: Keys) -> Int {
        return UserDefaults.standard.integer(forKey: forKey.rawValue)
    }
    
    private func set(bool: Bool, forKey: Keys) {
        UserDefaults.standard.set(bool, forKey: forKey.rawValue)
        UserDefaults.standard.synchronize()
    }
	
    private func set(int: Int, forKey: Keys) {
		UserDefaults.standard.set(int, forKey: forKey.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    
    private func set(string: String?, forKey: Keys) {
        UserDefaults.standard.set(string, forKey: forKey.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    private func string(forKey: Keys) -> String?{
        return UserDefaults.standard.string(forKey: forKey.rawValue)
    }
    
    
//    var udid: String {
//        if obj(forKey: .uiud) == nil { //значит еще не показывали
//            let nUdid = NSUUID().uuidString
//            set(string: nUdid, forKey: Keys.uiud)
//
//            return nUdid
//        }
//
//        return string(forKey: .uiud)!
//    }
    

    
    
    
    //MARK: Seartch
    
    var hideTranslate: Bool {
        set { set(bool: newValue, forKey: Keys.hideTranslate) }
        get { return bool(forKey: Keys.hideTranslate) }
    }
    
    var translateWay: Int {
        set { set(int: newValue, forKey: Keys.slectedSertchIndex) }
        get { return int(forKey: Keys.slectedSertchIndex) }
    }
}
