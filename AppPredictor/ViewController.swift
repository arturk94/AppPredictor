//
//  ViewController.swift
//  AppPredictor
//
//  Created by Artur KNOTHE on 17/11/2021.
//

import UIKit
import NaturalLanguage
import CoreML

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    private lazy var reviewClassifier: NLModel? = {
        // Create a custom model trained to classify or tag natural language text.
        // NL stands for Natual Language
        let model = try? NLModel(mlModel: AppReviewClassifier().model)
        return model
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func predictApp(_ sender: Any) {
        label.text = predict(textField.text ?? "")
    }
    
    private func predict(_ text: String) -> String? {
        reviewClassifier?.predictedLabel(for: text)
    }
}

