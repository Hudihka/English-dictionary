//
//  SearchViewController.swift
//  English dictionary
//
//  Created by Hudihka on 13/12/2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
	fileprivate var table: UITableView!
	fileprivate var labelClear: UILabel!
	fileprivate var gestersTap: UIView!
	fileprivate var seartchView: UISearchBar!
	
//	fileprivate weak var botomConstreint: NSLayoutConstraint!
	
	var presenter: SertchPresenter!
	
	fileprivate var dataArray: [Word] = []

    override func viewDidLoad() {
        super.viewDidLoad()
		
		desingUI()
        settingsTV()
        
        EnumNotification.UIKeyboardWillShow.subscribeNotific(observer: self, selector: #selector(adjustForKeydoard(notification:)))
        EnumNotification.UIKeyboardWillHide.subscribeNotific(observer: self, selector: #selector(adjustForKeydoard(notification:)))
        
        labelClear.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.sertchText(nil)
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
    
    
    //MARK: - actions
    
    @objc private func adjustForKeydoard(notification: Notification) {
        
        if let info = notification.userInfo, let keyboardFrame = (info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {

            let removeKeyboard = notification.name == UIApplication.keyboardWillHideNotification

			UIView.animate(withDuration: 0.27, animations: {
//				self.botomConstreint.constant = removeKeyboard ? 0 : keyboardFrame.height
			}) {[weak self] (compl) in
				if compl {
                    self?.settingsGesters(addGesters: !removeKeyboard)
                }
			}
        }
    }
	
	
	@objc private func tapGester() {
        seartchView.resignFirstResponder()
    }
	
	
	fileprivate func animateReloadData(duration: TimeInterval = 0){
		
        UIView.transition(with: self.table,
                          duration: duration,
                          options: .transitionCrossDissolve,
                          animations: {

            self.table.reloadData()
        })
	}
	
	private func desingUI(){
		
		let RBBI = UIBarButtonItem(title: "Отмена",
								   style: .plain,
								   target: self,
								   action: #selector(cancel))
		RBBI.tintColor = UIColor.red
		self.navigationItem.rightBarButtonItem = RBBI
		
		let segentTranslate = UISegmentedControl()
		segentTranslate.selectedSegmentTintColor = UIColor.white
		segentTranslate.insertSegment(withTitle: "Рус -> Англ", at: 0, animated: true)
		segentTranslate.insertSegment(withTitle: "Рус -> Англ", at: 1, animated: true)
		segentTranslate.selectedSegmentIndex = presenter.rusTranslate
		segentTranslate.addTarget(self, action: #selector(actionSegment(_ :)), for: .valueChanged)
		
		self.view.addSubview(segentTranslate)
		
		segentTranslate.snp.makeConstraints { (make) in
			make.top.equalTo(12)
			make.left.equalTo(16)
			make.right.equalTo(-16)
			make.height.equalTo(40)
		}
		
		let switchTranslate = UISwitch()
		switchTranslate.onTintColor = UIColor.black
		switchTranslate.isOn = presenter.hideTranslate
		switchTranslate.addTarget(self, action: #selector(switchAction(_ :)), for: .touchUpInside)
		self.view.addSubview(switchTranslate)
		
		switchTranslate.snp.makeConstraints { (make) in
			make.top.equalTo(segentTranslate.snp.bottom).offset(-16)
			make.left.equalTo(segentTranslate.snp.left)
		}
		
		let hideTranslate = UILabel()
		hideTranslate.font = UIFont.systemFont(ofSize: 20, weight: .semibold)

		self.view.addSubview(hideTranslate)
		hideTranslate.snp.makeConstraints({ (make) in
			make.height.equalTo(31)
			make.left.equalTo(15)
			make.right.equalTo(-15)
			make.top.equalTo(16)
		})
		
		labelClear = UILabel()
		labelClear.textColor = UIColor.black
		labelClear.font = UIFont.systemFont(ofSize: 25, weight: .bold)
		labelClear.textAlignment = .center
		self.view.addSubview(labelClear)
		
		labelClear.snp.makeConstraints({ (make) in
			make.height.equalTo(44)
			make.left.equalTo(0)
			make.right.equalTo(0)
			make.top.equalTo(273)
		})
		
		table = UITableView()
		self.view.addSubview(table)
		
		table.snp.makeConstraints({ (make) in
			make.top.equalTo(switchTranslate.snp.bottom).offset(-16)
			make.left.equalTo(0)
			make.right.equalTo(0)
			make.bottom.equalTo(0)
		})
		
		seartchView = UISearchBar()
        navigationItem.titleView = seartchView
        seartchView.delegate = self
		
		gestersTap = UIView()
		gestersTap.backgroundColor = UIColor.clear
		self.view.addSubview(gestersTap)
		
		gestersTap.snp.makeConstraints({ (make) in
			make.top.equalTo(table.snp.top)
			make.leading.equalTo(table.snp.leading)
			make.right.equalTo(table.snp.right)
			make.bottom.equalTo(table.snp.bottom)
		})
		
	}
	
	@objc private func cancel(){
        seartchView.resignFirstResponder()
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
	
	@objc private func actionSegment(_ sender: UISegmentedControl) {
		presenter.selectedRussia(rusValue: sender.selectedSegmentIndex)
        self.seartchView.text = ""
        self.seartchView.resignFirstResponder()
	}
	
	@objc private func switchAction(_ sender: UISwitch) {
		presenter.hideSwitch(hide: sender.isOn)
		animateReloadData(duration: 0.25)
	}
    
    deinit {
        print("деинитнули")
    }
}

extension SearchViewController: SertchViewProtocol {
	func allWordsFavorit(words: [Word]) {
		dataArray = words
		animateReloadData()
	}
	
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
        
		table.register(SearchDescriptionCell.self, forCellReuseIdentifier: "SearchDescriptionCell")
		table.register(SearchCell.self, forCellReuseIdentifier: "SearchCell")
        
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
			cell.presenter = presenter

			
			return cell
		}
		
        let cell = table.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchCell
        cell.tupl = tupl
        cell.presenter = presenter
        
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

