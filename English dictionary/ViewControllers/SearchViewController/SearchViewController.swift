//
//  SearchViewController.swift
//  English dictionary
//
//  Created by Hudihka on 13/12/2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController {
    
    @IBOutlet fileprivate weak var labelCount: UILabel!
    @IBOutlet fileprivate weak var table: UITableView!
	@IBOutlet weak var labelClear: UILabel!
	@IBOutlet fileprivate weak var gestersTap: UIView!
	
    @IBOutlet fileprivate var seartchView: UISearchBar!
	
	@IBOutlet weak var botomConstreint: NSLayoutConstraint!
	fileprivate var allForm: [Word] = []
	
	fileprivate var selectedTheme = [Theme]()
    fileprivate var favorit = false

    override func viewDidLoad() {
        super.viewDidLoad()

        settingsTV()
        
        EnumNotification.UIKeyboardWillShow.subscribeNotific(observer: self, selector: #selector(adjustForKeydoard(notification:)))
        EnumNotification.UIKeyboardWillHide.subscribeNotific(observer: self, selector: #selector(adjustForKeydoard(notification:)))
        
        settingsSeartchView()
        
        contentSettings(allClear: true, animatet: false)
	

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.reloadAllData()
    }
    
    
	static func presentSertchWord(activeVC: UIViewController, sectedThemes: [Theme], favorite: Bool){
        
        let NVC = EnumStoryboard.main.vc("SeartchWordNavigationController")
        NVC.modalPresentationStyle = .fullScreen
		
		if let nvc = NVC as? UINavigationController, let SVC = nvc.viewControllers.first as? SearchViewController {
			SVC.selectedTheme = sectedThemes
			SVC.favorit = favorite
		}
        
        activeVC.present(NVC, animated: false, completion: nil)
    }
    
    private func contentSettings(allClear: Bool, animatet: Bool = true){
        
        UIView.animate(withDuration: animatet ? 0.25 : 0) {
            self.labelCount.alpha = allClear ? 0 : 1
            
            self.table.alpha = allClear ? 0 : 1
            
            self.view.alpha = allClear ? 0.65 : 1
        }
        
    }
    
    private func settingsGesters(addGesters: Bool){
        
        if addGesters {
            let gesters = UITapGestureRecognizer(target: self, action: #selector(tapGester))
            gestersTap.addGestureRecognizer(gesters)
        } else {
            gestersTap.gestureRecognizers?.removeAll()
        }
        
        gestersTap.isUserInteractionEnabled = addGesters
    }
    
    private func settingsSeartchView(){
        navigationItem.titleView = seartchView
        seartchView.becomeFirstResponder()
        
        seartchView.delegate = self
        
        addCancelButton(selector: #selector(cancel), isLeft: false)
        
    }
    
    //
    func onSegmentedControllChange(left: Bool){
        reloadAllData()
    }


    
    //MARK: - actions
    
    @objc private func adjustForKeydoard(notification: Notification) {
        
        if let info = notification.userInfo, let keyboardFrame = (info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            let removeKeyboard = notification.name == UIApplication.keyboardWillHideNotification
			
			UIView.animate(withDuration: 0.27, animations: {
				self.bottomTableConstreint.constant = removeKeyboard ? 0 : keyboardFrame.height
			}) {[weak self] (compl) in
				if compl {
                    self?.settingsGesters(addGesters: !removeKeyboard)
                }
			}
            
        }
    }
	

	@IBAction func actionSegment(_ sender: UISegmentedControl) {
	}
	
    
    @objc private func tapGester() {
        seartchView.resignFirstResponder()
    }

    
    @objc private func cancel(){
        seartchView.resignFirstResponder()
        self.navigationController?.dismiss(animated: false, completion: nil)
    }
    
    fileprivate func reloadAllData(){
        

    }
    
    deinit {
        //
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    fileprivate func settingsTV(){
        
        table.delegate = self
        table.dataSource = self
        
        table.backgroundColor = .clear
        table.separatorStyle = .none
		
		
        
        table.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: "NotificationCell")
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allForm.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = table.dequeueReusableCell(withIdentifier: "NotificationCell") as! NotificationCell
//
//        cell.notific = dataArray[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92
    }
    
    

}


//MARK: - Seartch view

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        
        
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        seartchView.resignFirstResponder()
    }
}

