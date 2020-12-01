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
    
    @IBOutlet fileprivate weak var labelStatistic: UILabel!
    @IBOutlet fileprivate weak var labelWord: UILabel!
    @IBOutlet fileprivate weak var labelDescription: UILabel!
    
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    fileprivate var dataArray = [Word]()
    fileprivate var indexsesError = [IndexPath]()
    fileprivate var selectedWord: Word? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        barButtomItemDesing()
        settingsTV()
		
		startDesing()
    }
	
	override func viewDidAppear(_ animated: Bool){
		 super.viewDidAppear(animated)

		UIView.animate(withDuration: 0.4) {
			self.labelStatistic.alpha = 1
			self.labelWord.alpha = 1
			self.labelDescription.alpha = 1
		}
		
		UIView.transition(with: self.tableView,
						  duration: 0.4,
						  options: .transitionCrossDissolve,
						  animations: {
			self.tableView.reloadData()
		})
		
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
		
		labelStatistic.alpha = 0
		labelWord.alpha = 0
		labelDescription.alpha = 0
		
		labelStatistic.text = manager.textStatistic(newWord: false, itsError: false)
	}
	
    
    @objc private func cancel(){
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
}


extension ChekViewController: UITableViewDelegate, UITableViewDataSource{
    
    fileprivate func settingsTV(){
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 50
        
        tableView.register(UINib(nibName: "ChekCell", bundle: nil),
                       forCellReuseIdentifier: "ChekCell")
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChekCell") as! ChekCell
        cell.word = dataArray[indexPath.row]
        cell.itsError = indexsesError.contains(indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let selectedWord = selectedWord, indexsesError.contains(indexPath) == false else {
            tableView.reloadData()
            return
        }
        
        let word = dataArray[indexPath.row]
        
        if selectedWord == word {
            animateReloadDataOne()
            
            Vibro.weak()
        } else {
            Vibro.strong()
			if indexsesError.isEmpty {
				labelDescription.text = manager.textStatistic(newWord: false, itsError: true)
			}
			
            indexsesError.append(indexPath)
            tableView.reloadData()
        }
        
    }
    
	
	private func animateReloadDataOne(){
		
		
		let tupl = manager.createRandom
		dataArray = tupl.arrayWord
		selectedWord = tupl.word
		
		let textSlected = ManagerSettings.shared.rusAnglTranslate ? selectedWord?.rusValue : selectedWord?.engValue
		
		indexsesError = []
		
		UIView.animate(withDuration: 0.2, animations: {
			
			self.labelWord.alpha = 0
			self.labelDescription.alpha = 0
			
		}) {[weak self] (compl) in
			if compl {
				
				self?.labelWord.text = textSlected
				self?.labelDescription.text = self?.selectedWord?.descript
				self?.labelStatistic.text = self?.manager.textStatistic(newWord: true, itsError: false)
				
				self?.aniateReloadDataTwo()
			}
		}
		
		
		UIView.transition(with: self.tableView,
						  duration: 0.4,
						  options: .transitionCrossDissolve,
						  animations: {
			self.tableView.reloadData()
		})
	}
    
	private func aniateReloadDataTwo(){
		UIView.animate(withDuration: 0.2) {
			self.labelWord.alpha = 1
			self.labelDescription.alpha = 1
		}
	}
    
    
}
