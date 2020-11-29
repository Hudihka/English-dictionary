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
        
//        cell.valueSelected = selectedAllTheme
        
        return cell
    }
    
    
    
    
    
}
