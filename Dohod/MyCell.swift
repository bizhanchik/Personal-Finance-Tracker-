//
//  MyCell.swift
//  Dohod
//
//  Created by Swift on 06.10.2024.
//

import UIKit
import SnapKit



class MyCell: UITableViewCell {
    
    let image = UIImageView()
    let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(arrow:UIImage? , amount:String){
        image.image = arrow
        label.text = amount
    }
    
    func setupView(){
        contentView.addSubview(image)
        image.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(25)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview().inset(25)
            make.leading.equalTo(image.snp.trailing).offset(25)
        }
    }

}
