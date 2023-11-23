//
//  ViewController.swift
//  BMI
//
//  Created by macbook on 11.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let titleLabel = UILabel(text: "CALCULATE YOUR BMI", font: .boldSystemFont(ofSize: 40))
    private let heightLabel = UILabel(text: "Height")
    private let weightLabel = UILabel(text: "Weight")
    private let metersLabel = UILabel(text: "1.5m")
    private let kg = UILabel(text: "100kg")
    private let calculateButton = UIButton(backgroundColor: .purple, title: "CALCULATE", cornerRadius: 10)
    private let heightSlider = UISlider(min: 0.00, max: 3.00)
    private let weightSlider = UISlider(min: 0.00, max: 200.00)
    private var bmiCalculator = CalculateModel()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configView()
        setupConstraints()
        setupTargets()
    }
    
    
    private func setupView() {
        view.backgroundColor = UIColor(named: "lightPurple")
        view.addSubviews(titleLabel, heightLabel, weightLabel, metersLabel, kg, calculateButton, heightSlider, weightSlider)
    }
    private func configView() {
        heightSlider.tag = 0
        weightSlider.tag = 1
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -10),
            
            heightLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 250),
            heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            metersLabel.topAnchor.constraint(equalTo: heightLabel.topAnchor),
            metersLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            heightSlider.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 30),
            heightSlider.leadingAnchor.constraint(equalTo: heightLabel.leadingAnchor),
            heightSlider.trailingAnchor.constraint(equalTo: metersLabel.trailingAnchor),
            
            weightLabel.topAnchor.constraint(equalTo: heightSlider.bottomAnchor, constant: 30),
            weightLabel.leadingAnchor.constraint(equalTo: heightSlider.leadingAnchor),
            
            kg.topAnchor.constraint(equalTo: weightLabel.topAnchor),
            kg.trailingAnchor.constraint(equalTo: metersLabel.trailingAnchor),
            
            weightSlider.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 30),
            weightSlider.leadingAnchor.constraint(equalTo: weightLabel.leadingAnchor),
            weightSlider.trailingAnchor.constraint(equalTo: kg.trailingAnchor),
            
            calculateButton.topAnchor.constraint(equalTo: weightSlider.bottomAnchor, constant: 20),
            calculateButton.leadingAnchor.constraint(equalTo: weightSlider.leadingAnchor),
            calculateButton.trailingAnchor.constraint(equalTo: weightSlider.trailingAnchor),
            calculateButton.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            calculateButton.heightAnchor.constraint(equalToConstant: 50)
            
            
        ])
    }
    
    private func setupTargets() {
        heightSlider.addTarget(self, action: #selector(sliderAction), for: .allEvents)
        weightSlider.addTarget(self, action: #selector(sliderAction), for: .allEvents)
        calculateButton.addTarget(self, action: #selector(calculateAction), for: .touchUpInside)
    }
    
    @objc private func sliderAction(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            let value = String(format: "%.2f",  sender.value)
            metersLabel.text = value + "m"
        case 1:
            let value = String(format: "%.f", sender.value)
            kg.text = value + "kg"
            print("Pressed")
        default:
            break
        }
        
    }
    
    @objc private func calculateAction() {
        bmiCalculator.calculateBMI(height: heightSlider.value, weight: weightSlider.value)
        guard let bmi = bmiCalculator.bmi else { return }

        let vc = ResultsViewController(bmiValue: bmiCalculator.getBMI(), advice: bmi.advice, color: bmi.color)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

extension ViewController: ViewControllerDelegate {
    
    func getResult() -> Float {
        bmiCalculator.calculateBMI(height: heightSlider.value, weight: weightSlider.value)
        return bmiCalculator.bmi?.value ?? 0.0
        
    }
    
    func getAdvice() -> String {
        return bmiCalculator.bmi?.advice ?? "Somthing wrong"
    }
    
    func getColor() -> UIColor {
        return bmiCalculator.bmi?.color ?? .white
    }
    
    
}


    
    



//MARK: - SwiftUI
import SwiftUI
struct Provider_ViewController : PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            return ViewController()
        }
        
        typealias UIViewControllerType = UIViewController
        
        
        let viewController = ViewController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<Provider_ViewController.ContainterView>) -> ViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: Provider_ViewController.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<Provider_ViewController.ContainterView>) {
            
        }
    }
    
}
