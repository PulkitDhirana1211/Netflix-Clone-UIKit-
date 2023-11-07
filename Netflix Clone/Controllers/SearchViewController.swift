//
//  SearchViewController.swift
//  Netflix Clone
//
//  Created by Pulkit Dhirana on 01/11/23.
//

import UIKit

class SearchViewController: UIViewController {

    private let discoverTable: UITableView = {
       let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier )
       return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
}
