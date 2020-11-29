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
	
	@IBOutlet weak var allWords: UIButton!
	@IBOutlet weak var capitalDictionary: UIButton!
    
    
    fileprivate var dataArray: [Theme] = []
    
    fileprivate var selectedTheme: [Theme] = []
    fileprivate var selectedAllTheme = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		allWords.addRadius(number: 8)
		capitalDictionary.addRadius(number: 8)
        
        dataArray = Theme.findAll()
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
        
        tableView.register(UINib(nibName: "AllWordCell", bundle: nil),
                       forCellReuseIdentifier: "AllWordCell")
        
        tableView.register( UINib(nibName: "ThemeCell", bundle: nil),
                        forCellReuseIdentifier: "ThemeCell")
        
        
        tableView.register(UINib(nibName: "HederCells", bundle: nil),
                       forHeaderFooterViewReuseIdentifier: "HederCells")
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.isEmpty ? 1 : 0
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        return dataArray.count
	}
	
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AllWordCell") as! AllWordCell
            cell.valueSelected = selectedAllTheme
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThemeCell") as! ThemeCell
        let theme = dataArray[indexPath.row]
        cell.theme = theme
        
        if selectedAllTheme {
            cell.valueSelected = true
        } else {
            cell.valueSelected = selectedTheme.contains(theme)
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let user = users[indexPath.row]
////        if let index = selectedUserIDs.firstIndex(of: user.id ?? -1) {
////            selectedUserIDs.remove(at: index)
////        } else {
////            selectedUserIDs.append(user.id ?? -1)
////        }
//        tableView.reloadData()
    }

	
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 80
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HederCells") as! HederCells
        cell.titleLable.isHidden = section == 1
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}
