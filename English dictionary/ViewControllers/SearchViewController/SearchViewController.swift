//
//  SearchViewController.swift
//  English dictionary
//
//  Created by Hudihka on 13/12/2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet fileprivate weak var table: UITableView!
	@IBOutlet fileprivate weak var labelClear: UILabel!
	@IBOutlet fileprivate weak var gestersTap: UIView!
	
	
	@IBOutlet fileprivate var seartchView: UISearchBar!
    
	@IBOutlet fileprivate weak var botomConstreint: NSLayoutConstraint!
	
	var presenter: SertchPresenter!
	
	fileprivate var dataArray: [Word] = []

    override func viewDidLoad() {
        super.viewDidLoad()
		
        settingsTV()
        
        EnumNotification.UIKeyboardWillShow.subscribeNotific(observer: self, selector: #selector(adjustForKeydoard(notification:)))
        EnumNotification.UIKeyboardWillHide.subscribeNotific(observer: self, selector: #selector(adjustForKeydoard(notification:)))
        
        settingsSeartchView()
        
        labelClear.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.animateReloadData(duration: 0.3)
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
		presenter.selectedRussia(rusValue: sender.selectedSegmentIndex)
        self.seartchView.text = ""
        self.seartchView.resignFirstResponder()
//        if !dataArray.isEmpty {
//            table.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
//        }
	}
	
	@IBAction private func switchAction(_ sender: UISwitch) {
		presenter.hideSwitch(hide: sender.isOn)
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
    

	
	fileprivate func animateReloadData(duration: TimeInterval = 0){
        UIView.transition(with: self.table,
                          duration: duration,
                          options: .transitionCrossDissolve,
                          animations: {

            self.table.reloadData()
        })
	}
    
    deinit {
        print("деинитнули")
    }
}

extension SearchViewController: SertchViewProtocol {
	func reloadTranslate(words: [Word]) {
		dataArray = words
		animateReloadData(duration: 0.25)
	}
	
	
	func allWords(words: [Word]) {
		dataArray = words
		animateReloadData()
	}
	
	var hideLabel: Bool {
		set{
			labelClear.isHidden = newValue
		}
		get{
			return true
		}
	}
	
}



extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    fileprivate func settingsTV(){
        
        table.delegate = self
        table.dataSource = self
		
		table.estimatedRowHeight = 106
        
        table.backgroundColor = .clear
        table.separatorStyle = .none
        
        table.register(UINib(nibName: "SearchDescriptionCell", bundle: nil),
					   forCellReuseIdentifier: "SearchDescriptionCell")
		
		table.register(UINib(nibName: "SearchCell", bundle: nil),
					   forCellReuseIdentifier: "SearchCell")
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
        return dataArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let word = dataArray[indexPath.row]
        let tupl: (word: Word, russValue: Bool, hideTranslate: Bool) = (word: word,
																		russValue: presenter.rusTranslate == 0,
																		hideTranslate: presenter.hideTranslate)
		
		if word.descript != nil {
			let cell = table.dequeueReusableCell(withIdentifier: "SearchDescriptionCell") as! SearchDescriptionCell
            cell.tupl = tupl
            cell.blockReloadData = {[weak self] in
				self?.animateReloadData(duration: 0)
            }
			
			return cell
		}
		
        let cell = table.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchCell
        cell.tupl = tupl
        cell.blockReloadData = {[weak self] in
			self?.animateReloadData(duration: 0)
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
    }
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if presenter.hideTranslate {
			
			if let cell = table.cellForRow(at: indexPath) as? SearchDescriptionCell{
				cell.showAnimate()
				return
			}
			
			if let cell = table.cellForRow(at: indexPath) as? SearchCell{
				cell.showAnimate()
			}
		}
	}
    
    

}


//MARK: - Seartch view

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		presenter.sertchText(searchText.textEditor)
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        seartchView.resignFirstResponder()
    }
}

