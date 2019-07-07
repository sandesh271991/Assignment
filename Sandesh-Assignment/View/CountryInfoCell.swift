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
    
    var countryInfoViewModel: CountryInfoViewModel? {
        didSet {
            lblTitle.text = countryInfoViewModel?.titleText
            lblDescription.attributedText = countryInfoViewModel?.desctiptionText
            imgRefrenceView.pin_updateWithProgress = true
            //imgRefrenceView.pin_setPlaceholder(with: UIImage.init(named: placeholderImage))
            if let url = countryInfoViewModel?.imageHrefUrl {
                imgRefrenceView.pin_setImage(from: url, completion: { (result) in
                    self.layoutIfNeeded()
                })
            }
        }
    }
    
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
            make.topMargin.equalTo(lblTitle).offset(20)
        }
    
//        imgRefrenceView?.snp.makeConstraints { (make) -> Void in
//            make.left.equalTo(contentView).offset(5)
//            make.centerX.equalTo(contentView)
//        }
        
    }
}
