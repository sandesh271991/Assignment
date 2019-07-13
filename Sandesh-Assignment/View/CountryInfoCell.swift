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
            imgRefrenceView.pin_setPlaceholder(with: UIImage.init(named: "PlaceholderImg"))
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
        contentView.addSubview(contentBackgroundView)
        
        lblTitle = UILabel(frame: .zero)
        lblTitle.font = UIFont.boldSystemFont(ofSize: 20.0)
        lblTitle.textColor = .black
        lblTitle.clipsToBounds = true
        lblTitle.numberOfLines = 0
        contentBackgroundView.addSubview(lblTitle)
        
        imgRefrenceView = UIImageView.init(frame: .zero)
        imgRefrenceView.clipsToBounds = true
        imgRefrenceView.contentMode = .scaleAspectFit
        imgRefrenceView?.image = UIImage.init(named: "PlaceholderImg")
        contentBackgroundView.addSubview(imgRefrenceView)
        
        lblDescription = UILabel(frame: .zero)
        lblDescription.clipsToBounds = true
        lblDescription.numberOfLines = 0
        contentBackgroundView.addSubview(lblDescription)
        
        self.setupLayout()
    }
    
    func setupLayout() {
        
        contentBackgroundView?.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(contentView)
        }

        lblTitle?.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(contentBackgroundView).offset(0)
            make.right.equalTo(contentBackgroundView).offset(0)
            make.top.equalTo(contentBackgroundView).offset(5)
        }
        
        imgRefrenceView?.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(lblTitle)
            make.right.equalTo(lblTitle)
            make.top.equalTo(lblTitle.snp.bottom).offset(10)
        }

        lblDescription?.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(lblTitle)
            make.right.equalTo(lblTitle)
            make.top.equalTo(imgRefrenceView.snp.bottom).offset(10)
            make.bottom.equalTo(contentBackgroundView).offset(-10)
        }
    }
}
