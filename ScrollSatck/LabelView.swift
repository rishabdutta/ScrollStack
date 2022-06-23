//
//  LabelView.swift
//  ScrollSatck
//
//  Created by rishab.dutta on 23/06/22.
//

import Foundation
import UIKit

class LabelView: UIView {
    
    var text: String? {
        didSet {
            valueLabel.text = text            
        }
    }
    
    private lazy var valueLabel: UILabel = {
        let vl = UILabel()
        vl.isUserInteractionEnabled = false
        vl.translatesAutoresizingMaskIntoConstraints = false
        vl.textAlignment = .left
        vl.backgroundColor = .orange
        return vl
    }()
    
    init() {
        super.init(frame: .zero)
        
        addSubview(valueLabel)
                
        NSLayoutConstraint.activate([
            valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            valueLabel.topAnchor.constraint(equalTo: topAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}
