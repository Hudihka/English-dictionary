//
//  MasterSplitViewController.swift
//  English dictionary
//
//  Created by Админ on 15.01.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import UIKit

struct AnswerWord {
	var word: Word?
	var words = [Word]()
	var answer: Bool?
	
	init(word: Word, wordsArray: [Word]) {
		self.word = word
		
		var words = wordsArray.filter({$0.id != word.id})[randomPick: 10]
        let randomIndex = arc4random() % 10
        words[Int(randomIndex)] = word
		self.words = words
	}
	
	mutating func answer(answer: Bool) {
		self.answer = answer
		self.words = []
	}
	
}

class MasterSplitViewController: UITableViewController {
    
    fileprivate var dataArray: [Word] = []
	var answers = [String : AnswerWord]()
    
    fileprivate var rusEng = true
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        settingsTV()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.reloadAllData(duration: 0.3)
    }
    
    
    @discardableResult static func route(dataArray: [Word],
										 rusEngTranslate: Bool) -> (nav: UINavigationController,
																	master: MasterSplitViewController) {
        
        let NVC = EnumStoryboard.main.vc("SplitNavigationController") as! UINavigationController
        NVC.modalPresentationStyle = .fullScreen
        NVC.view.backgroundColor = .white
        
        let MVC = NVC.viewControllers.first as! MasterSplitViewController
        
        MVC.rusEng = rusEngTranslate
        MVC.dataArray = dataArray
		
		if let word = dataArray.first, let id = word.id {
			MVC.answers = [id : AnswerWord(word: word, wordsArray: dataArray)]
		}
        
        return (nav: NVC, master: MVC)
        
    }
	
	func messageAnswer(idWord: String, answer: Bool){
		if var struc = answers[idWord]{
			struc.answer(answer: answer)
			answers[idWord] = struc
			tableView.reloadData()
		}
	}
    

    @IBAction fileprivate func dismiss(_ sender: Any) {
        SplitViewController.activeSplitVC = true
        self.navigationController?.splitViewController?.dismiss(animated: true, completion: nil)
    }
    

    
    fileprivate func reloadAllData(duration: TimeInterval = 0){
        
        UIView.transition(with: self.tableView,
                          duration: duration,
                          options: .transitionCrossDissolve,
                          animations: {

            self.tableView.reloadData()
        })
    }
    
    
    fileprivate func settingsTV(){
        tableView.estimatedRowHeight = 70
        
        tableView.backgroundColor = UIColor(rgb: 0xE9E9E9)
        tableView.separatorStyle = .none
        
        tableView.register(UINib(nibName: "CellMaster", bundle: nil),
                       forCellReuseIdentifier: "CellMaster")
        
        tableView.register(UINib(nibName: "MasterHeder", bundle: nil),
                       forHeaderFooterViewReuseIdentifier: "MasterHeder")
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let word = dataArray[indexPath.row]
        let tupl: (word: Word, rusEngl: Bool) = (word: word, rusEngl: rusEng)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellMaster") as! CellMaster
        
        cell.wordAndTranslate = tupl
		cell.trueAnswer = nil
		
		if let id = word.id, let answer = answers[id]?.answer{
			cell.trueAnswer = answer
		}
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let word = dataArray[indexPath.row]
		
		guard let id = word.id else {return}
		
		if let struc = answers[id]{
			//уже отвечали что то делали
			
			if let answer = struc.answer {
				//уже отвечали
			} else {
				//еще не отвечали
			}
			
		}
		
        
    }
    
    //heder
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MasterHeder") as! MasterHeder
        
		let answersArray = answers.values.compactMap({$0.answer})
		
		cell.countTrue  = answersArray.filter({$0 == true}).count
        cell.countFalse = answersArray.filter({$0 == false}).count
        cell.count      = dataArray.count
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 84
    }

}
