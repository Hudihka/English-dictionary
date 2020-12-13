//
//  NewThemeViewController.swift
//  English dictionary
//
//  Created by Hudihka on 15/11/2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class SettingsChekViewController: BaseViewController {
	

    @IBOutlet fileprivate weak var segmentControll: UISegmentedControl!
    @IBOutlet fileprivate weak var switchStatistic: UISwitch!
    @IBOutlet fileprivate weak var switchOneTheme: UISwitch!
    
    
    
    @IBOutlet fileprivate weak var goButton: UIButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        goButton.addRadius(number: 8)
        
        if ManagerSettings.shared.selectedTheme.count == 1 {
            switchOneTheme.isEnabled = false
        }
    }
    

    
    @IBAction func dissmis(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goButtonAction(_ sender: Any) {
        let oneTheme = ManagerSettings.shared.selectedTheme.count == 1 ? true : switchOneTheme.isOn
        
        ManagerSettings.shared.newSettings(rusAnglTranslate: segmentControll.selectedSegmentIndex == 0,
                                           visibleStatistic: switchStatistic.isOn,
                                           oneThemeQestion: oneTheme)
        
        let VC = ChekViewController.route()
        self.navigationController?.pushViewController(VC, animated: true)
        
	}
	

}



