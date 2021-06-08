//
//  ViewController.swift
//  English dictionary
//
//  Created by Hudihka on 15/11/2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import UIKit
import SnapKit

class StartViewController: BaseViewController {

	private var tableView: UITableView!
	private var startedChek: UIButton!
	private var clearThemes: UIBarButtonItem!
    
    var presenter: StartViewPresenterProtocol!
    
    fileprivate var dataArray: [Theme] = []
    fileprivate var selectedTheme: [Theme] = []
    
    var selectedFavor = false
    var selectedAll: Bool {
        return dataArray.count == selectedTheme.count
    }
    
    
	
	override func viewDidLoad() {
		super.viewDidLoad()
		settingsTV()
		settingsNavigationBar()
		addDownButton()
		
        presenter.getAllThemes()
        settingsButtons()
	}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.getAllThemes()
    }

    
    
    private func openSplit(rusEngTranslate: Bool){
        let SVC = SplitViewController.route(sectedThem: selectedTheme,
                                            favoriteSelect: selectedFavor,
                                            rusEngTranslate: rusEngTranslate)
        
        SVC.modalPresentationStyle = .fullScreen
        SVC.delegate = self
        self.navigationController?.present(SVC, animated: true, completion: nil)
    }
	
	//MARK - Action
	
	@objc private func clearAllTheme() {
        presenter.clearAll()
	}
    
    @objc private func stratedChek() {

        let alert = UIAlertController(title: "Выберите способ",
                                      message: nil,
                                      preferredStyle: .actionSheet)


        alert.addAction(UIAlertAction(title: "Тест Рус -> Англ", style: .default, handler: {[weak self] (_) in
            guard let selF = self else {return}
            selF.openSplit(rusEngTranslate: true)
        }))

        alert.addAction(UIAlertAction(title: "Тест Англ -> Рус", style: .default, handler: {[weak self] (_) in
            guard let selF = self else {return}
            selF.openSplit(rusEngTranslate: false)
        }))

        alert.addAction(UIAlertAction(title: "Зубрешка", style: .default, handler: {[weak self] (_) in

            guard let selF = self else {return}
			let VC = Builder.routeSertchWord(sectedThemes: selF.selectedTheme,
											 favorite: selF.selectedFavor)
			selF.present(VC, animated: true, completion: nil)
        }))

        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))


        self.present(alert, animated: true, completion: nil)

    }
    
    private func settingsButtons(){
        let enabled = !selectedTheme.isEmpty || selectedFavor
		startedChek.isEnabled = enabled
		startedChek.alpha = enabled ? 1 : 0.2
        
        clearThemes.isEnabled = enabled
    }
    
	//UI Settings
	
	private func settingsNavigationBar(){
		self.clearThemes = UIBarButtonItem(title: "Сброс",
										   style: .plain,
										   target: self,
										   action: #selector(clearAllTheme))
		
		self.clearThemes.tintColor = UIColor.black
		self.navigationItem.leftBarButtonItem = self.clearThemes
	}
	
	private func addDownButton(){
		
		let whiteView = UIView()
		whiteView.backgroundColor = UIColor.white
		self.view.addSubview(whiteView)
		
		whiteView.snp.makeConstraints { (make) in
			make.bottom.equalTo(self.view.safeAreaLayoutGuide)
			make.height.equalTo(64)
			make.left.equalTo(0)
			make.right.equalToSuperview()
		}
		
		startedChek = UIButton()
		startedChek.backgroundColor = UIColor.black
		startedChek.addTarget(self, action: #selector(stratedChek), for: .touchUpInside)
		startedChek.addRadius(number: 8)
		startedChek.setTitle("НАЧАТЬ", for: .normal)
		startedChek.setTitleColor(UIColor.white, for: .normal)
		startedChek.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
		whiteView.addSubview(startedChek)
		
		startedChek.snp.makeConstraints({ (make) in
			make.bottom.equalTo(-10)
			make.top.equalTo(10)
			make.left.equalTo(20)
			make.right.equalTo(-20)
		})
	}
}

extension StartViewController: UITableViewDelegate, UITableViewDataSource{
	
	fileprivate func settingsTV(){
		tableView = UITableView(frame: CGRect(), style: .grouped)
		self.view.addSubview(tableView)
		tableView.snp.makeConstraints { (make) in
			make.top.equalToSuperview()
			make.left.equalToSuperview()
			make.right.equalToSuperview()
			make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-64)
		}
		
		
		tableView.delegate = self
		tableView.dataSource = self
		
		tableView.separatorStyle = .none
		
		tableView.register(AllWordCell.self, forCellReuseIdentifier: "AllWordCell")
		tableView.register(FavoriteWords.self, forCellReuseIdentifier: "FavoriteWords")
		tableView.register(ThemeCell.self, forCellReuseIdentifier: "ThemeCell")
		
		tableView.register(HederCells.self, forHeaderFooterViewReuseIdentifier: "HederCells")
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
        return 2
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return Word.allCountFavorite < 5 ? 1 : 2
        }
        
        return dataArray.count
	}
	
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "AllWordCell") as! AllWordCell
                cell.valueSelected = selectedAll
                
                return cell
            }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteWords") as! FavoriteWords
            cell.valueSelected = selectedFavor || selectedAll
            cell.count = Word.allCountFavorite
            
            return cell
            
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThemeCell") as! ThemeCell
        let theme = dataArray[indexPath.row]
        cell.theme = theme
        
        cell.valueSelected = selectedTheme.contains(theme)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            
            if indexPath.row == 0 {
                presenter.selectedAll()
            } else {
                presenter.tapedFavorit()
            }
                
                
        } else {
            
            let theme = dataArray[indexPath.row]
            presenter.selected(themes: theme)
            
        }
        
    }

	
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 80
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HederCells") as! HederCells
        
        if section == 1 {
            cell.text = "Всего \(dataArray.count) тем"
        } else if section == 0 {
            let count = Word.findAll().count
            cell.text = "Всего \(count) слов"
        }
        
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}


extension StartViewController: UISplitViewControllerDelegate {
    
    func splitViewController(_ splitViewController: UISplitViewController,
                    collapseSecondary secondaryViewController: UIViewController,
                    onto primaryViewController: UIViewController) -> Bool{
        
        return true
    }
    
}


extension StartViewController: StartViewProtocol {
    func selectedFavorite(selectedFavorite: Bool) {
        self.selectedFavor = selectedFavorite
        settingsButtons()
        tableView.reloadData()
    }
    
    
    func reloadSelectedThemes(themes: [Theme]) {
        selectedTheme = themes
        settingsButtons()
        tableView.reloadData()
    }
    
    func allThemes(themes: [Theme]) {
        dataArray = themes
        tableView.reloadData()
    }
    
}
