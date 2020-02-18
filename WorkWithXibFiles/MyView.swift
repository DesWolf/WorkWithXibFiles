//
//  MyView.swift
//  WorkWithXibFiles
//
//  Created by Максим Окунеев on 2/17/20.
//  Copyright © 2020 Максим Окунеев. All rights reserved.
//

import UIKit

@IBDesignable class MyView: UIView {

    @IBOutlet var myLabel: UILabel!
    
    var textLabelText: String {
    get {
        return myLabel.text!
    }
    set(textLabelText){
        myLabel.text = textLabelText
    }
    }
    
    var view: UIView!
    var nibName: String = "MyView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    

    
    func loadFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
    func setup() {
        view = loadFromNib()
        view.frame = bounds
        
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
    }
}
