//
//  ChekTestViewController.swift
//  English dictionary
//
//  Created by Админ on 15.01.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import UIKit

class ChekTestViewController: BaseViewController {

	fileprivate var labelWord: UILabel!
	fileprivate var labelTranslate: UILabel!
    
	fileprivate var table: UITableView!
    
    fileprivate var rusEng = true
    
	var answerWord: AnswerWord? {
        didSet{
            reloadDesing()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

		desingUI()
        settingsTV()
    }
    
    @discardableResult static func route(answerWord: AnswerWord?,
                                        rusEngTranslate: Bool) -> UINavigationController {
        
        let VC = ChekTestViewController()
        
        VC.answerWord  = answerWord
        VC.rusEng    = rusEngTranslate

		let NVC = UINavigationController(rootViewController: VC)
        
        return NVC
        
    }
	
	private func desingUI(){
		
		labelWord = UILabel()
		labelWord.textColor = UIColor.black
		labelWord.font = UIFont.systemFont(ofSize: 29, weight: .bold)
		labelWord.textAlignment = .center
		labelWord.numberOfLines = 0
		self.view.addSubview(labelWord)
		
		labelWord.snp.makeConstraints({ (make) in
			make.height.greaterThanOrEqualTo(31)
			make.left.equalTo(20)
			make.right.equalTo(-20)
			make.top.equalTo(150)
		})
		
		labelTranslate = UILabel()
		labelTranslate.textColor = UIColor.black
		labelTranslate.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
		labelTranslate.textAlignment = .center
		labelTranslate.numberOfLines = 0
		self.view.addSubview(labelTranslate)
		
		labelTranslate.snp.makeConstraints({ (make) in
			make.height.greaterThanOrEqualTo(29)
			make.left.equalTo(20)
			make.right.equalTo(-20)
			make.top.equalTo(labelWord.snp.bottom).offset(20)
		})
		
		table = UITableView()
		self.view.addSubview(table)
		
		table.snp.makeConstraints({ (make) in
			make.top.equalTo(0)
			make.left.equalTo(0)
			make.right.equalTo(0)
			make.bottom.equalTo(0)
		})
		
		
	}
    
    private func reloadDesing(){
        loadViewIfNeeded()
        
        guard let answerWord = answerWord, let word = answerWord.word else {
            return
        }
		
        
        let wordValue      = rusEng ? word.rusValue : word.engValue
        let translateValue = !rusEng ? word.rusValue : word.engValue
        
        self.table.alpha = 1
        self.table.isUserInteractionEnabled = true
        
		self.table.isHidden = answerWord.answer != nil
        self.title = wordValue
        
        self.labelWord.text      = wordValue
        self.labelTranslate.text = translateValue
        
        table.reloadData()
    }
    
    
    

}


extension ChekTestViewController: UITableViewDelegate, UITableViewDataSource{
    
    fileprivate func settingsTV(){
        
        table.delegate = self
        table.dataSource = self
        
        table.estimatedRowHeight = 51
        
        table.backgroundColor = .white
        table.separatorStyle = .none
        
		table.register(ChekWordCell.self,
                       forCellReuseIdentifier: "ChekWordCell")
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return answerWord?.words.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "ChekWordCell") as! ChekWordCell
        
		if let word = answerWord?.words[indexPath.row] {
			cell.textTranslate = !rusEng ? word.rusValue : word.engValue
		}
	
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
		
		guard let answerWord = answerWord, let word = answerWord.word else {
			return
		}
        
		if let cell = tableView.cellForRow(at: indexPath) as? ChekWordCell {
            
            table.isUserInteractionEnabled = false
			let id = answerWord.words[indexPath.row].id
			let answer = id == word.id
            
//            сообщаем ответ
			reloadSplitMasterVC(idWord: word.id ?? "", answer: answer)
            cell.colorSelected(answerTrue: answer)
			
			self.table.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
			
			UIView.animateKeyframes(withDuration: 0.3, delay: 0.1, options: [], animations: {
				self.table.alpha = 0
			}) {[weak self] (com) in
				if com {
					self?.table.isHidden = true
				}
			}
        }
    }
	
	private func reloadSplitMasterVC(idWord: String, answer: Bool){
		if let split = self.navigationController?.splitViewController as? SplitViewController{
			split.reloadMasterVC(idWord: idWord, answer: answer)
		}
	}
}
