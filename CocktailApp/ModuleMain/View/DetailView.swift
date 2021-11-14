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
    
    lazy var nameDrink = createLabel(size: 30)
    lazy var strq = createLabel(size: 30)
    
    lazy var img1 = createImage()
    lazy var img2 = createImage()
    
    //uiview block 1
    var blockView1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cyan
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
    lazy var instructionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        addSubview(view)
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setupView(){
        backgroundColor = .white
        
        addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        scrollView.addSubview(blockView1)
        scrollView.addSubview(blockView2)
        
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
        
        //ContentView View
        blockView1.addSubview(nameDrink)
        NSLayoutConstraint.activate([
            nameDrink.topAnchor.constraint(equalTo: blockView1.topAnchor),
            nameDrink.leadingAnchor.constraint(equalTo: blockView1.leadingAnchor),
            nameDrink.trailingAnchor.constraint(equalTo: blockView1.trailingAnchor),
            nameDrink.heightAnchor.constraint(equalToConstant: 36)
        ])
        
        //Img1
        blockView1.addSubview(img1)
        
        NSLayoutConstraint.activate([
            img1.topAnchor.constraint(equalTo: nameDrink.bottomAnchor),
            img1.leadingAnchor.constraint(equalTo: blockView1.leadingAnchor),
            img1.trailingAnchor.constraint(equalTo: blockView1.trailingAnchor),
          //  img1.heightAnchor.constraint(equalTo: img1.widthAnchor,multiplier: imgH!/imgW!)
            //last
            img1.bottomAnchor.constraint(equalTo: blockView1.bottomAnchor)
        ])

        blockView2.addSubview(strq)
        NSLayoutConstraint.activate([
            strq.topAnchor.constraint(equalTo: blockView2.topAnchor),
            strq.leadingAnchor.constraint(equalTo: blockView2.leadingAnchor),
            strq.trailingAnchor.constraint(equalTo: blockView2.trailingAnchor),
          //  strq.heightAnchor.constraint(equalToConstant: 222),
            strq.bottomAnchor.constraint(equalTo: blockView2.bottomAnchor)
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
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.backgroundColor = .blue
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
        label.backgroundColor = .yellow
        label.text = "test"
        return label
    }
    
    func makeDescriptionLabel() -> UILabel {
        let titleLabel = createLabel(size: 20)
        titleLabel.textAlignment = .center
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        return titleLabel
    }
}

extension UIImage {

    func aspectFitImage(inRect rect: CGRect) -> UIImage? {
        let width = self.size.width
        let height = self.size.height
        let aspectWidth = rect.width / width
        let aspectHeight = rect.height / height
        let scaleFactor = aspectWidth > aspectHeight ? rect.size.height / height : rect.size.width / width

        UIGraphicsBeginImageContextWithOptions(CGSize(width: width * scaleFactor, height: height * scaleFactor), false, 0.0)
        self.draw(in: CGRect(x: 0.0, y: 0.0, width: width * scaleFactor, height: height * scaleFactor))

        defer {
            UIGraphicsEndImageContext()
        }

        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
