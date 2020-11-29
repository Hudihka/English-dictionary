//
//  NewThemeViewController.swift
//  English dictionary
//
//  Created by Hudihka on 15/11/2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class NewThemeViewController: UIViewController {
	
	fileprivate var saveBlock: () -> () = { }

	@IBOutlet fileprivate weak var saveButton: UIButton!
	@IBOutlet fileprivate weak var textField: UITextField!
	
	override func viewDidLoad() {
        super.viewDidLoad()

		textField.delegate = self
		textField.becomeFirstResponder()
		
		saveButton.addRadius(number: 8)
		saveButton.isEnabled = false
    }
    
	static func route(activeVC: UIViewController, compl: () -> ()){
		if let NVC = EnumStoryboard.main.vc("NavigationNevTheme") as? UINavigationController{
			
			if let first = NVC.viewControllers.first as? NewThemeViewController{
				first.saveBlock = {
					compl()
				}
			}
			
			NVC.modalPresentationStyle = .fullScreen
			activeVC.present(NVC, animated: true, completion: nil)
		}
		
	}
	
	@IBAction func saveButton(_ sender: Any) {
		//TO DO добавить сохранение в кор дату
		self.saveBlock()
		self.navigationController?.dismiss(animated: true, completion: nil)
	}
	

}


extension NewThemeViewController: UITextFieldDelegate{
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		
		let text = textField.resultStringOptional(string: string, range: range)
		saveButton.isEnabled = text != nil
		
		return true
	}
	
}
