//
//  CountryInfoCell.swift
//  Sandesh-Assignment
//
//  Created by sandesh sardar on 06/07/19.
//  Copyright © 2019 sandesh sardar. All rights reserved.
//

import UIKit

class CountryInfoCell: UITableViewCell {
    
    var contentBackgroundView: UIView!
    var lblTitle: UILabel!
    var lblDescription: UILabel!
    var imgRefrenceView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        contentBackgroundView = UIView.init(frame: .zero)
        contentBackgroundView.backgroundColor = .red
        contentView.addSubview(contentBackgroundView)
        
        lblTitle = UILabel(frame: .zero)
        lblTitle.font = UIFont.boldSystemFont(ofSize: 20.0)
        lblTitle.textColor = .black
        lblTitle.clipsToBounds = true
        lblTitle.numberOfLines = 0
         lblTitle.backgroundColor = .orange
        lblTitle.text = "sandesh"
        contentBackgroundView.addSubview(lblTitle)
        
        imgRefrenceView = UIImageView.init(frame: .zero)
        imgRefrenceView.clipsToBounds = true
        imgRefrenceView.contentMode = .scaleAspectFill
        imgRefrenceView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        imgRefrenceView.backgroundColor = .yellow
        //imgRefrenceView?.image = UIImage.init(named: placeholderImage)
        contentBackgroundView.addSubview(imgRefrenceView)
        
        lblDescription = UILabel(frame: .zero)
        lblDescription.clipsToBounds = true
        lblDescription.numberOfLines = 0
         lblDescription.backgroundColor = .purple
        lblDescription.text = "sardar"
        contentBackgroundView.addSubview(lblDescription)
        
        self.setupLayout()
    }
    
    func setupLayout() {
        
        contentBackgroundView?.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(contentView);
        }
        
        lblTitle?.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(contentView).offset(20)
            make.right.equalTo(contentView).offset(-20)
            make.top.equalTo(contentView).offset(0)
        }
        
        lblDescription?.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(lblTitle)
            make.right.equalTo(lblTitle)
            make.bottom.equalTo(lblTitle).offset(20)
        }
    
        lblDescription?.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(contentView).offset(5)
            make.centerX.equalTo(contentView)
        }
        
    }
}
