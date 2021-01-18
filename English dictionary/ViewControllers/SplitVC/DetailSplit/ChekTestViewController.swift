//
//  ChekTestViewController.swift
//  English dictionary
//
//  Created by Админ on 15.01.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import UIKit

class ChekTestViewController: BaseViewController {
    
    var ansverBlock: (Word, Bool) -> Void = { _,_ in }

    @IBOutlet fileprivate weak var labelWord: UILabel!
    @IBOutlet fileprivate weak var labelTranslate: UILabel!
    
    @IBOutlet fileprivate weak var table: UITableView!
    
    fileprivate var rusEng = true
    fileprivate var isAnswer = false
    
    fileprivate var word: Word?
    fileprivate var dataArray = [Word]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        desingUI()
        settingsTV()
    }
    
    @discardableResult static func pushSplit(activeVC: UIViewController,
                                            word: Word,
                                            dataArray: [Word],
                                            isAnswer: Bool,
                                            rusEngTranslate: Bool) -> ChekTestViewController {
        
        let VC = EnumStoryboard.main.vc("ChekTestViewController") as! ChekTestViewController
        
        VC.word      = word
        VC.dataArray = dataArray
        VC.isAnswer  = isAnswer
        VC.rusEng    = rusEngTranslate
        
        activeVC.navigationController?.pushViewController(VC, animated: true)
        
        return VC
        
    }
    
    private func desingUI(){
        
        guard let word = word else {
            return
        }
        
        let wordValue      = rusEng ? word.rusValue : word.engValue
        let translateValue = !rusEng ? word.rusValue : word.engValue
        
        self.table.isHidden = isAnswer
        self.title = isAnswer ? nil : wordValue
        
        self.labelWord.text      = wordValue
        self.labelTranslate.text = translateValue
        
        
        
        
        
        
    }
    
    
    

}


extension ChekTestViewController: UITableViewDelegate, UITableViewDataSource{
    
    fileprivate func settingsTV(){
        
        table.delegate = self
        table.dataSource = self
        
        table.estimatedRowHeight = 50
        
        table.backgroundColor = .clear
        table.separatorStyle = .none
        
        table.register(UINib(nibName: "ChekWordCell", bundle: nil),
                       forCellReuseIdentifier: "ChekWordCell")
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let word = dataArray[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "ChekWordCell") as! ChekWordCell
        
        cell.textTranslate = rusEng ? word.rusValue : word.engValue
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath) as? ChekWordCell, let word = word{
            
            table.isUserInteractionEnabled = false
            
            let answer = dataArray[indexPath.row].id == word.id
            
            self.ansverBlock(word, answer)
            cell.colorSelected(answerTrue: answer)
            
            UIView.animateKeyframes(withDuration: 0.3, delay: 0.1, options: []) {
                self.table.alpha = 0
            } completion: {[weak self] (com) in
                if com {
                    self?.table.isHidden = true
                }
            }
        }
    }
    
    
    
}