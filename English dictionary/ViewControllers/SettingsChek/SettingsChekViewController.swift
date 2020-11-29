//
//  NewThemeViewController.swift
//  English dictionary
//
//  Created by Hudihka on 15/11/2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class SettingsChekViewController: BaseViewController {
	

	@IBOutlet fileprivate weak var goButton: UIButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        goButton.add
    }
    
	static func route(activeVC: UIViewController, compl: () -> ()){

        
		
	}
    
    @IBAction func segmentControll(_ sender: Any) {
    }
    
    @IBAction func switchStatistic(_ sender: Any) {
    }
    
    @IBAction func switchOneTheme(_ sender: Any) {
    }
    
    
    @IBAction func goButtonAction(_ sender: Any) {
		self.saveBlock()
		self.navigationController?.dismiss(animated: true, completion: nil)
	}
	

}



