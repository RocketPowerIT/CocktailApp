//
//  DetailView.swift
//  CocktailApp
//
//  Created by mac on 13/11/2021.
//

import UIKit

class DetailView: UIView {
    
    weak var myDetailViewController:DetailViewController?{
        didSet{
            setupViewController()
        }
    }
    
    lazy var drinkLabel = createLabel(size: 30)
    lazy var instructionLabel = createLabel(size: 30)
    
    lazy var coctailImg = createImage()
    
    //uiview block 1
    var blockView1: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    //uiview block 2
    var blockView2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    
    //uiview block 3
    var blockView3: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        backgroundColor = .clear
        
        addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        scrollView.addSubview(blockView1)
        scrollView.addSubview(blockView2)
        
       // blockView1
        NSLayoutConstraint.activate([
            blockView1.topAnchor.constraint(equalTo: scrollView.topAnchor),
            blockView1.leadingAnchor.constraint(equalTo: leadingAnchor),
            blockView1.trailingAnchor.constraint(equalTo: trailingAnchor),
            blockView1.bottomAnchor.constraint(equalTo: blockView2.topAnchor)
        ])
        
        //blockView2
        NSLayoutConstraint.activate([
            blockView2.topAnchor.constraint(equalTo: blockView1.bottomAnchor),
            blockView2.leadingAnchor.constraint(equalTo: leadingAnchor),
            blockView2.trailingAnchor.constraint(equalTo: trailingAnchor),
            blockView2.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        //blockView1 ->nameDrink
        blockView1.addSubview(drinkLabel)
        NSLayoutConstraint.activate([
            drinkLabel.topAnchor.constraint(equalTo: blockView1.topAnchor, constant: 10),
            drinkLabel.leadingAnchor.constraint(equalTo: blockView1.leadingAnchor),
            drinkLabel.trailingAnchor.constraint(equalTo: blockView1.trailingAnchor),
        ])
        
        ////blockView1 -> coctailImg
        blockView1.addSubview(coctailImg)
        
        NSLayoutConstraint.activate([
            coctailImg.topAnchor.constraint(equalTo: drinkLabel.bottomAnchor, constant: 10),
            coctailImg.leadingAnchor.constraint(equalTo: blockView1.leadingAnchor),
            coctailImg.trailingAnchor.constraint(equalTo: blockView1.trailingAnchor),
            coctailImg.heightAnchor.constraint(equalTo: coctailImg.widthAnchor, multiplier: 1),

            coctailImg.bottomAnchor.constraint(equalTo: blockView1.bottomAnchor)
        ])
        
        blockView2.addSubview(instructionLabel)
        NSLayoutConstraint.activate([
            instructionLabel.topAnchor.constraint(equalTo: blockView2.topAnchor),
            instructionLabel.leadingAnchor.constraint(equalTo: blockView2.leadingAnchor),
            instructionLabel.trailingAnchor.constraint(equalTo: blockView2.trailingAnchor),
            instructionLabel.bottomAnchor.constraint(equalTo: blockView2.bottomAnchor)
        ])
    }
    
    func setupViewController(){
        translatesAutoresizingMaskIntoConstraints = false
        if let vc = myDetailViewController {
            vc.view.addSubview(self)
            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.topAnchor),
                bottomAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.bottomAnchor),
                leadingAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.leadingAnchor),
                trailingAnchor.constraint(equalTo: vc.view.safeAreaLayoutGuide.trailingAnchor)
            ])
        }
    }
}

extension DetailView {
    func createImage()->UIImageView {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
    
    func createLabel(size: CGFloat) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: size)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.layer.cornerRadius = 90
        return label
    }
}
