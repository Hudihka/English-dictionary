//
//  ViewController.swift
//  English dictionary
//
//  Created by Hudihka on 15/11/2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	@IBAction func goNewTheme(_ sender: Any) {
		
		NewThemeViewController.route(activeVC: self) {
			self.tableView.reloadData()
		}
	}
	
}

extension StartViewController: UITableViewDelegate, UITableViewDataSource{
	
	fileprivate func settingsTV(){
		tableView.delegate = self
		tableView.dataSource = self
		
		tableView.separatorStyle = .none
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		<#code#>
	}

	
}
