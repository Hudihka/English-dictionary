//
//  BaseCell.swift
//  English dictionary
//
//  Created by Hudihka on 08/06/2021.
//  Copyright © 2021 OOO MegaStar. All rights reserved.
//

import Foundation
import UIKit

class BaseCell: UITableViewCell {
    
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		desingUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func desingUI(){
		
		
	}

    
}

