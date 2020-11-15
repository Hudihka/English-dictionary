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
        case accessToken      = "access_token"
        case refreshToken     = "refresh_token"
        
        case uiud             = "key_UDID"
        
        case biometrics       = "biometrics"
        case hasLocalPinCode  = "hasLocalPinCode"
    }

    
    static let shared = DefaultUtils()
    
    private func obj(forKey: Keys) -> Any? {
        return UserDefaults.standard.object(forKey: forKey.rawValue)
    }
    
    
    private func bool(forKey: Keys) -> Bool {
        return UserDefaults.standard.bool(forKey: forKey.rawValue)
    }
    
    private func set(bool: Bool, forKey: Keys) {
        UserDefaults.standard.set(bool, forKey: forKey.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    
    private func set(string: String?, forKey: Keys) {
        UserDefaults.standard.set(string, forKey: forKey.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    private func string(forKey: Keys) -> String?{
        return UserDefaults.standard.string(forKey: forKey.rawValue)
    }
    
    
    var udid: String {
        if obj(forKey: .uiud) == nil { //значит еще не показывали
            let nUdid = NSUUID().uuidString
            set(string: nUdid, forKey: Keys.uiud)
            
            return nUdid
        }
        
        return string(forKey: .uiud)!
    }
    
    func removeAllKey() {
        if let appDomain = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: appDomain)
        }
    }
    
    
    //MARK: TOKENS
    
    var accessToken: String? {
        set { set(string: newValue, forKey: Keys.accessToken) }
        get {
            if let token = string(forKey: Keys.accessToken){
                return "Bearer \(String(describing: token))"
            }
            
            return nil
        }
    }
    
    var refreshToken: String? {
        set { set(string: newValue, forKey: Keys.refreshToken) }
        get { return string(forKey: Keys.refreshToken) }
    }
    
    
    
    //MARK: Settings
    
    var biometrics: Bool {
        set { set(bool: newValue, forKey: Keys.biometrics) }
        get { return bool(forKey: Keys.biometrics) }
    }
    
    var localPinCode: Bool {
        set { set(bool: newValue, forKey: Keys.hasLocalPinCode) }
        get { return bool(forKey: Keys.hasLocalPinCode) }
    }
}
