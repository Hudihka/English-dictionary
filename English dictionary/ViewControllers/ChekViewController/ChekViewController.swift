//
//  ChekViewController.swift
//  English dictionary
//
//  Created by Админ on 29.11.2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class ChekViewController: BaseViewController {
    
    fileprivate let manager = ManagerSettings.shared
    
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    fileprivate var dataArray = [Word]()
    fileprivate var indexsesError = [IndexPath]()
    fileprivate var selectedWord: Word? = nil
    fileprivate var textStatistic: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        barButtomItemDesing()
        settingsTV()
		
		startDesing()
    }
	
	override func viewDidAppear(_ animated: Bool){
		 super.viewDidAppear(animated)
		
        animateReloadData()
	 }
	
    
    static func route() -> UIViewController{
        
        let vc = EnumStoryboard.main.vc("ChekViewController")
        
        return vc
    }
    

    private func barButtomItemDesing(){
        
        let cancelButton:UIBarButtonItem = UIBarButtonItem(title: "Отмена",
                                                           style: .plain,
                                                           target:self,
                                                           action:#selector(cancel))
        cancelButton.tintColor = .red
        
        self.navigationItem.leftBarButtonItem = cancelButton
        
    }
	
	private func startDesing(){
		
		let tupl = manager.createRandom
		dataArray = tupl.arrayWord
		selectedWord = tupl.word
    
        textStatistic = manager.textStatistic(newWord: false, itsError: false)
	}
	
    
    @objc private func cancel(){
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    
    fileprivate func animateReloadData(){
        UIView.transition(with: self.tableView,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: {
            self.tableView.reloadData()
        })
    }
    
}


extension ChekViewController: UITableViewDelegate, UITableViewDataSource{
    
    fileprivate func settingsTV(){
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 50
        
        tableView.register(UINib(nibName: "ChekCell", bundle: nil),
                       forCellReuseIdentifier: "ChekCell")
        
        tableView.register(UINib(nibName: "ChekWordInfoCell", bundle: nil),
                       forCellReuseIdentifier: "ChekWordInfoCell")
        
        tableView.register(UINib(nibName: "HederCells", bundle: nil),
                       forHeaderFooterViewReuseIdentifier: "HederCells")
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChekWordInfoCell") as! ChekWordInfoCell
            cell.word = selectedWord
            cell.textStatistic = textStatistic
            
            cell.blockTapedFavorite = {
                self.tableView.reloadData()
            }
            
            return cell
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChekCell") as! ChekCell
        cell.word = dataArray[indexPath.row]
        cell.itsError = indexsesError.contains(indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            return
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let selectedWord = selectedWord, indexsesError.contains(indexPath) == false else {
            tableView.reloadData()
            return
        }
        
        let word = dataArray[indexPath.row]
        
        if selectedWord == word {
            reloadWord()
            
            Vibro.weak()
        } else {
            Vibro.strong()
            
			if indexsesError.isEmpty {
				textStatistic = manager.textStatistic(newWord: false, itsError: true)
			}
			
            indexsesError.append(indexPath)
            tableView.reloadData()
        }
        
    }
    
	
	private func reloadWord(){
		
		
		let tupl = manager.createRandom
		dataArray = tupl.arrayWord
		selectedWord = tupl.word
		
		
		indexsesError = []
		
        textStatistic = manager.textStatistic(newWord: true, itsError: false)
		
		
		animateReloadData()
	}
    
    //MARK: -HEDERS
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            return nil
        }
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HederCells") as! HederCells
        
        cell.titleLable.isHidden = true
        cell.labelChecVC.isHidden = false
        cell.separator.isHidden = true
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 0.00001
        }
        
        return 40
        
    }
    
    
}
