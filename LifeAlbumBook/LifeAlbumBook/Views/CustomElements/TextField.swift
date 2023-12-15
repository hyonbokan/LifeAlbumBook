//
//  TextField.swift
//  LifeAlbumBook
//
//  Created by dnlab on 12/15/23.
//

import UIKit

class TextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        leftViewMode = .always
        layer.cornerRadius = 30
        layer.borderWidth = 3
        backgroundColor = .secondarySystemBackground
        layer.borderColor = UIColor.systemBrown.cgColor
        autocapitalizationType = .none
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
