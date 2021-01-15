//
//  MasterSplitViewController.swift
//  English dictionary
//
//  Created by Админ on 15.01.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import UIKit

class MasterSplitViewController: BaseViewController {

    @IBOutlet fileprivate weak var table: UITableView!
    
    fileprivate var dataArray: [Word] = []
    
    fileprivate var answerIdWordTrue  = [String]()
    fileprivate var answerIdWordFalse = [String]()
    
    fileprivate var selectedTheme = [Theme]()
    fileprivate var favorit = false
    fileprivate var rusEng = true
    
    fileprivate var defUt = DefaultUtils.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsTV()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.reloadAllData(duration: 0.3)
    }
    
    
    @discardableResult static func presentSplit(activeVC: UIViewController,
                                                sectedThem: [Theme],
                                                favoriteSelect: Bool,
                                                rusEngTranslate: Bool) -> MasterSplitViewController {
        
        let NVC = EnumStoryboard.main.vc("SplitNavigationController") as! UINavigationController
        NVC.modalPresentationStyle = .fullScreen
        NVC.view.backgroundColor = .white
        
        let MVC = NVC.viewControllers.first as! MasterSplitViewController
        
        MVC.selectedTheme = sectedThem
        MVC.favorit = favoriteSelect
        MVC.rusEng = rusEngTranslate
        
        MVC.dataArray = Word.words(text: nil,
                                   themes: sectedThem,
                                   favorite: favoriteSelect,
                                   rusValue: nil)//будет постоянно рандом
        
        activeVC.present(NVC, animated: true, completion: nil)
        
        return MVC
        
    }
    

    @IBAction fileprivate func dismiss(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    

    
    fileprivate func reloadAllData(duration: TimeInterval = 0){
        
        UIView.transition(with: self.table,
                          duration: duration,
                          options: .transitionCrossDissolve,
                          animations: {

            self.table.reloadData()
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
    
    deinit {
        //
    }
}

extension MasterSplitViewController: UITableViewDelegate, UITableViewDataSource {
    
    fileprivate func settingsTV(){
        
        table.delegate = self
        table.dataSource = self
        
        table.estimatedRowHeight = 70
        
        table.backgroundColor = .clear
        table.separatorStyle = .none
        
        table.register(UINib(nibName: "CellMaster", bundle: nil),
                       forCellReuseIdentifier: "CellMaster")
        
        table.register(UINib(nibName: "MasterHeder", bundle: nil),
                       forHeaderFooterViewReuseIdentifier: "MasterHeder")
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let word = dataArray[indexPath.row]
        let tupl: (word: Word, rusEngl: Bool) = (word: word, rusEngl: rusEng)
        
        let cell = table.dequeueReusableCell(withIdentifier: "CellMaster") as! CellMaster
        
        cell.wordAndTranslate = tupl
        cell.trueAnswer       = answerTrue(word: word)
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
    }
    
    //heder
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MasterHeder") as! MasterHeder
        
        cell.countTrue  = answerIdWordTrue.count
        cell.countFalse = answerIdWordFalse.count
        cell.count      = dataArray.count
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 84
    }

}
