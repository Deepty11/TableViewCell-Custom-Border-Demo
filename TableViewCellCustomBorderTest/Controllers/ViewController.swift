//
//  ViewController.swift
//  TableViewCellCustomBorderTest
//
//  Created by Rehnuma Reza on 31/7/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let contents = ["Apple",
                    "Banana",
                    "Strawberry",
                    "Grapes",
                    "Lichie",
                    "Jackfruit",
                    "Watermelon",
                    "Strawberry",
                    "Grapes",
                    "Lichie",
                    "Jackfruit",
                    "Watermelon",
                    "Strawberry",
                    "Grapes",
                    "Lichie",
                    "Jackfruit",
                    "Watermelon",
                    "Strawberry",
                    "Grapes",
                    "Lichie",
                    "Jackfruit",
                    "Watermelon"
    ]
    
    lazy var tableView: UITableView =  {
        let tv = UITableView()
        tv.register(UINib(nibName: String(describing: OptionsTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: OptionsTableViewCell.self))
        tv.dataSource = self
        tv.delegate = self
        tv.rowHeight = UITableView.automaticDimension
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }


}

//MARK: - DataSource
extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: OptionsTableViewCell.self),
                                                    for: indexPath) as? OptionsTableViewCell {
            cell.nameLabel.text = contents[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
}

