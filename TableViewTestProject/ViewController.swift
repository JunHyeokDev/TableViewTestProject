//
//  ViewController.swift
//  NetflixClone2
//
//  Created by 김준혁 on 2023/02/11.
//

import UIKit

class ViewController: UIViewController {
    
    var items = [String]()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter text here"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let myButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Click me!", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.addTarget(ViewController.self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    
    @objc func buttonAction() {
        let enteredText = textField.text ?? ""
        if enteredText != ""{
            items.append(enteredText)
        }
        textField.text = nil
        tableView.reloadData()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        textField.delegate = self
        
        myButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        
        AddSubViews()
        setUI()
    }
    
    private func AddSubViews() {
        view.addSubview(textField)
        view.addSubview(myButton)
        view.addSubview(tableView)
    }
    
    private func setUI() {
        
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 44),
            
            myButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
            myButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            myButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            myButton.heightAnchor.constraint(equalToConstant: 44),
            
            tableView.topAnchor.constraint(equalTo: myButton.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            //
            
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 300)
            
        ])
        
    }
    
}




extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    
}
