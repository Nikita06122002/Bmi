//
//  ResultsViewController.swift
//  BMI
//
//  Created by macbook on 19.11.2023.
//

import UIKit

class ResultsViewController: UIViewController {
    
    private let titleLabel = UILabel(text: "YOUR RESULT", font: .boldSystemFont(ofSize: 40))
    private var resultLabel = UILabel(font: .boldSystemFont(ofSize: 55))
    private let descriptionLabel = UILabel(font: .systemFont(ofSize: 25))
    private let button = UIButton(backgroundColor: .white, title: "Recalculate", titleColor: .black, cornerRadius: 10)
    weak var delegate: ViewControllerDelegate?
    private let bmiValue: String?
    private let advice: String?
    private let color: UIColor?

    init(bmiValue: String, advice: String, color: UIColor) {
        self.bmiValue = bmiValue
        self.advice = advice
        self.color = color
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
        addTargets()
        
    }
    
    private func setupUI() {
        view.addSubviews(titleLabel, resultLabel, descriptionLabel, button)
        view.backgroundColor = color
        titleLabel.text = bmiValue
        descriptionLabel.text = advice
        navigationItem.hidesBackButton = true

    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 140),
            
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 15),
            
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func addTargets() {
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }

 
    @objc private func buttonAction() {
        navigationController?.popViewController(animated: true)
    }

}





