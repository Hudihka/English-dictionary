//
//  MasterSplitViewController.swift
//  English dictionary
//
//  Created by Админ on 15.01.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import UIKit

class MasterSplitViewController: UITableViewController {
    
    var blockTapedCell: (Word, [Word]) -> Void = {_,_ in}
    
    fileprivate var dataArray: [Word] = []
    
    fileprivate var answerIdWordTrue  = [String]()
    fileprivate var answerIdWordFalse = [String]()
    
    fileprivate var favorit = false
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
                                         rusEngTranslate: Bool) -> MasterSplitViewController {
        
        let NVC = EnumStoryboard.main.vc("SplitNavigationController") as! UINavigationController
        NVC.modalPresentationStyle = .fullScreen
        NVC.view.backgroundColor = .white
        
        let MVC = NVC.viewControllers.first as! MasterSplitViewController
        
        MVC.rusEng = rusEngTranslate
        MVC.dataArray = dataArray
        
        return MVC
        
    }
    

    @IBAction fileprivate func dismiss(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    

    
    fileprivate func reloadAllData(duration: TimeInterval = 0){
        
        UIView.transition(with: self.tableView,
                          duration: duration,
                          options: .transitionCrossDissolve,
                          animations: {

            self.tableView.reloadData()
        })
    }
    
    fileprivate func answerTrue(word: Word) -> Bool?{
        
        if let id = word.id {
            if answerIdWordTrue.contains(id){
                return true
            }
            
            if answerIdWordFalse.contains(id){
                return false
            }
        }
        
        return nil
        
    }
    
    
    fileprivate func settingsTV(){
        tableView.estimatedRowHeight = 70
        
        tableView.backgroundColor = .clear
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
        cell.trueAnswer       = answerTrue(word: word)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let word = dataArray[indexPath.row]
        var words = dataArray.filter({$0.id != word.id})[randomPick: 10]
        let randomIndex = arc4random() % 10
        words[Int(randomIndex)] = word
        
        self.blockTapedCell(word, words)
        
//        let VC = ChekTestViewController.pushSplit(activeVC: self,
//                                                  word: word,
//                                                  dataArray: words,
//                                                  isAnswer: answerTrue(word: word) != nil,
//                                                  rusEngTranslate: rusEng)
//
//        VC.ansverBlock = {[weak self] word, answer in
//            guard let selF = self, let id = word.id else {return}
//
//
//            if answer {
//                selF.answerIdWordTrue.append(id)
//            } else {
//                selF.answerIdWordFalse.append(id)
//            }
//
//            selF.tableView.reloadData()
//        }
        
    }
    
    //heder
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MasterHeder") as! MasterHeder
        
        cell.countTrue  = answerIdWordTrue.count
        cell.countFalse = answerIdWordFalse.count
        cell.count      = dataArray.count
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 84
    }

}
