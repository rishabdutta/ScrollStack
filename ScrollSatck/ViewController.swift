//
//  ViewController.swift
//  ScrollSatck
//
//  Created by rishab.dutta on 23/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    var randomText: String? {
        get {
            return ["Balance sheet", "Car wash", "Doom", "Plethora", "Candy factory", "Carnage", "Marvel", "very good sire", "Purse snatcher"].randomElement()
        }
    }
    
    lazy var button: UIButton = {
        let bt = UIButton()
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Change text", for: .normal)
        bt.setTitleColor(.red, for: .normal)
        bt.addTarget(self, action: #selector(changeText), for: .touchUpInside)
        return bt
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(button)
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)        
        
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            scrollView.heightAnchor.constraint(equalToConstant: 100),
            
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 30),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 100),
        
        ])
        
        for _ in 1...5 {
            let lv = LabelView()
            lv.text = randomText
            stackView.addArrangedSubview(lv)
        }
    }

    @objc func changeText() {
        stackView.arrangedSubviews.forEach {
            if let lv = $0 as? LabelView {
                lv.text = randomText
            }
        }
        
        /*
         According to Apple docs of UIStackView -
         The stack view automatically updates its layout whenever views are added,
         removed or inserted into the arrangedSubviews array, or whenever one of the
         arranged subviews’s isHidden property changes.
         
         This workaround saves us the trouble of manually calculating the size of subviews and update the size.
         Even layoutIfNeeded() doesn't work.
         
         It's a stupid workaround but works flawlessly.
         */
        let firstView = stackView.arrangedSubviews[0]
        firstView.isHidden = true
        firstView.isHidden = false
    }

}

