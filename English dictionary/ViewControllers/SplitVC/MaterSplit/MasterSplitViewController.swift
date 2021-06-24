//
//  MasterSplitViewController.swift
//  English dictionary
//
//  Created by Админ on 15.01.2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import UIKit


class MasterSplitViewController: UITableViewController, MasterSplitProtocol {
    
    var dataArray: [AnswerWord] = [] {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    var presenter: MasterSplitPresenter!
    
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellMaster") as! CellMaster
        
        let answer = dataArray[indexPath.row]
        let tupl: (answer: AnswerWord, rusEngl: Bool) = (answer: answer, rusEngl: rusEng)
        
        cell.wordAndTranslate = tupl
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let answer = dataArray[indexPath.row]
		
        
    }
    
    //heder
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MasterHeder") as! MasterHeder
        cell.count = dataArray.count
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 84
    }
    
    
    func counnt(trueCount: Int, falseCount: Int) {
        
        if let heder = tableView.tableHeaderView as? MasterHeder{
            heder.countTrue  = trueCount
            heder.countFalse = falseCount
        }
        
    }

}
