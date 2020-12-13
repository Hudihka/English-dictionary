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
    fileprivate var selectedFavorite = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
        startedChek.addRadius(number: 8)
        startedChek.isEnabled = false
        startedChek.alpha = 0.2
        
        seeButton.isEnabled = false
        
        dataArray = Theme.findAll()
        settingsTV()
	}

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        dataArray = Theme.findAll()
        tableView.reloadData()
    }
    

	@IBAction func goNewTheme(_ sender: Any) {
		SearchViewController.presentSertchWord(activeVC: self,
											   sectedThemes: [],
											   favorite: true)
	}
    
    @IBAction func stratedChek(_ sender: Any) {
        ManagerSettings.shared.createTheme(selectedTheme: self.selectedTheme, sertchFavorite: selectedFavorite)
        
        let NVC = EnumStoryboard.main.vc("ChekNavigationController")
        NVC.modalPresentationStyle = .fullScreen
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
        
        tableView.register( UINib(nibName: "FavoriteWords", bundle: nil),
                        forCellReuseIdentifier: "FavoriteWords")
        
        
        tableView.register(UINib(nibName: "HederCells", bundle: nil),
                       forHeaderFooterViewReuseIdentifier: "HederCells")
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
        return 2
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return Word.allCountFavorite < 5 ? 1 : 2
        }
        
        return dataArray.count
	}
	
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "AllWordCell") as! AllWordCell
                cell.valueSelected = selectedAllTheme
                
                return cell
            }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteWords") as! FavoriteWords
            cell.valueSelected = selectedFavorite
            cell.count = Word.allCountFavorite
            
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
            
            if indexPath.row == 0 {
                
                if selectedAllTheme == false {
                    selectedAllTheme = true
                    selectedFavorite = true
                    selectedTheme = dataArray
                } else {
                    selectedAllTheme = false
                    selectedFavorite = false
                    selectedTheme = []
                }
                
            } else {//фаворит ячейка
                
                selectedFavorite = !selectedFavorite
                
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
        
        var selectedEmpty = true
        
        if !selectedTheme.isEmpty || selectedFavorite {
            selectedEmpty = false
        }
        
        seeButton.isEnabled = !selectedEmpty
        startedChek.alpha = selectedEmpty ? 0.2 : 1
        startedChek.isEnabled = !selectedEmpty
        tableView.reloadData()
    }

	
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 80
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HederCells") as! HederCells
        
        if section == 1 {
            cell.text = "Всего \(dataArray.count) тем"
        } else if section == 0 {
            let count = Word.findAll().count
            cell.text = "Всего \(count) слов"
        }
        
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
