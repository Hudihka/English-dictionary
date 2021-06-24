//
//  MasterSplitViewController.swift
//  English dictionary
//
//  Created by Админ on 15.01.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import UIKit


class MasterSplitViewController: UITableViewController {
    
	var dataArray: [Word] = []
	var answers = [String : AnswerWord]()
    
	var rusEng = true
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        desingUI()
        settingsTV()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.reloadAllData(duration: 0.3)
    }
    
    
//    @discardableResult static func route(dataArray: [Word],
//										 rusEngTranslate: Bool) -> (nav: UINavigationController,
//																	master: MasterSplitViewController) {
//
//
//		let MVC = MasterSplitViewController()
//		MVC.rusEng = rusEngTranslate
//		MVC.dataArray = dataArray
//
//		if let word = dataArray.first, let id = word.id {
//			MVC.answers = [id : AnswerWord(word: word, wordsArray: dataArray)]
//		}
//
//		let NVC = UINavigationController()
//		NVC.modalPresentationStyle = .fullScreen
//		NVC.view.backgroundColor = .white
//
//        return (nav: NVC, master: MVC)
//
//    }
	
	func messageAnswer(idWord: String, answer: Bool){
		if var struc = answers[idWord]{
			struc.answer(answer: answer)
			answers[idWord] = struc
			tableView.reloadData()
		}
	}
	
	
    

	@objc fileprivate func dismissVC() {
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
	
	private func desingUI(){
		self.view.backgroundColor = .white
		
		self.title = "Выбранные слова"
		
		let LBBI = UIBarButtonItem(title: "Отмена",
								   style: .plain,
								   target: self,
								   action: #selector(dismissVC))
								   
		LBBI.tintColor = UIColor.red
		self.navigationItem.leftBarButtonItem = LBBI
	}
    
    
    fileprivate func settingsTV(){
        tableView.estimatedRowHeight = 70
        
        tableView.backgroundColor = UIColor(rgb: 0xE9E9E9)
        tableView.separatorStyle = .none
        
		tableView.register(CellMaster.self,
                       forCellReuseIdentifier: "CellMaster")
        
		tableView.register(MasterHeder.self,
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
			collDetailSplit(answer: struc)
			return
		}
		
		let answer = AnswerWord(word: word, wordsArray: dataArray)
		self.answers[id] = answer
		collDetailSplit(answer: answer)
        
    }
	
	private func collDetailSplit(answer: AnswerWord){
		if let split = self.navigationController?.splitViewController as? SplitViewController{
			split.reloadDetailVC(answerWord: answer)
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
