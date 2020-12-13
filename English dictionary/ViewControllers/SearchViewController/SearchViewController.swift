//
//  SearchViewController.swift
//  English dictionary
//
//  Created by Hudihka on 13/12/2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet fileprivate weak var labelCount: UILabel!
    @IBOutlet fileprivate weak var table: UITableView!
	@IBOutlet fileprivate weak var labelClear: UILabel!
	@IBOutlet fileprivate weak var gestersTap: UIView!
	
    @IBOutlet fileprivate var seartchView: UISearchBar!
	
	@IBOutlet fileprivate weak var botomConstreint: NSLayoutConstraint!
	fileprivate var dataArray: [Word] = []
	
	fileprivate var selectedTheme = [Theme]()
    fileprivate var favorit = false

    override func viewDidLoad() {
        super.viewDidLoad()
		
        settingsTV()
        
        EnumNotification.UIKeyboardWillShow.subscribeNotific(observer: self, selector: #selector(adjustForKeydoard(notification:)))
        EnumNotification.UIKeyboardWillHide.subscribeNotific(observer: self, selector: #selector(adjustForKeydoard(notification:)))
        
        settingsSeartchView()
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.reloadAllData()
    }
    
    
	static func presentSertchWord(activeVC: UIViewController, sectedThemes: [Theme], favorite: Bool){
        
        let NVC = EnumStoryboard.main.vc("SeartchWordNavigationController")
        NVC.modalPresentationStyle = .fullScreen
		NVC.view.backgroundColor = .white
		
		if let nvc = NVC as? UINavigationController, let SVC = nvc.viewControllers.first as? SearchViewController {
			SVC.selectedTheme = sectedThemes
			SVC.favorit = favorite
		}
        
        activeVC.present(NVC, animated: true, completion: nil)
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
        
        seartchView.delegate = self
        
//        addCancelButton(selector: #selector(cancel), isLeft: false)
        
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
				self.botomConstreint.constant = removeKeyboard ? 0 : keyboardFrame.height
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

	@IBAction fileprivate func dismiss(_ sender: Any) {
        cancel()
	}
	
    fileprivate func cancel(){
        seartchView.resignFirstResponder()
        self.navigationController?.dismiss(animated: true, completion: nil)
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
		
		table.estimatedRowHeight = 106
        
        table.register(UINib(nibName: "SearchDescriptionCell", bundle: nil),
					   forCellReuseIdentifier: "SearchDescriptionCell")
		
		table.register(UINib(nibName: "SearchCell", bundle: nil),
					   forCellReuseIdentifier: "SearchCell")
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		labelClear.isHidden = !dataArray.isEmpty
        return dataArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let word = dataArray[indexPath.row]
		
		if word.descript != nil {
			let cell = table.dequeueReusableCell(withIdentifier: "SearchDescriptionCell") as! SearchDescriptionCell
			
			
			return cell
		}
		
        let cell = table.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchCell
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
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

