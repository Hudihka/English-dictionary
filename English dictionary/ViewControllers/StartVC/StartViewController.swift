//
//  ViewController.swift
//  English dictionary
//
//  Created by Hudihka on 15/11/2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class StartViewController: BaseViewController {

	@IBOutlet weak var tableView: UITableView!
	
	@IBOutlet weak var startedChek: UIButton!
    @IBOutlet weak var seeButton: UIBarButtonItem!
    
    
    fileprivate var dataArray: [Theme] = []
    
    fileprivate var selectedTheme: [Theme] = []
    fileprivate var selectedAllTheme = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
        startedChek.addRadius(number: 8)
        startedChek.isEnabled = false
        startedChek.alpha = 0.2
        
        seeButton.isEnabled = false
        
        dataArray = Theme.findAll()
        settingsTV()
	}

	@IBAction func goNewTheme(_ sender: Any) {
		

	}
    
    @IBAction func stratedChek(_ sender: Any) {
        ManagerSettings.shared.createTheme(selectedTheme: self.selectedTheme)
        
        let NVC = EnumStoryboard.main.vc("ChekNavigationController")
        NVC.modalPresentationStyle = .overFullScreen
        self.navigationController?.present(NVC, animated: true, completion: nil)
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
        
        cell.valueSelected = selectedTheme.contains(theme)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            
            if selectedAllTheme == false {
                selectedAllTheme = true
                selectedTheme = dataArray
            } else {
                selectedAllTheme = false
                selectedTheme = []
            }
        
        } else {
            let theme = dataArray[indexPath.row]
            
            if selectedTheme.contains(theme) {
                selectedTheme = selectedTheme.filter({$0 != theme})
                if selectedTheme.isEmpty, selectedAllTheme{
                    selectedAllTheme = false
                }
            } else {
                selectedTheme.append(theme)
            }
            
        }
        
        seeButton.isEnabled = !selectedTheme.isEmpty
        startedChek.alpha = selectedTheme.isEmpty ? 0.2 : 1
        startedChek.isEnabled = !selectedTheme.isEmpty
        tableView.reloadData()
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
        return 40
        
    }
}
