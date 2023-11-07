//
//  DownloadsViewController.swift
//  Netflix Clone
//
//  Created by Pulkit Dhirana on 01/11/23.
//

import UIKit

class DownloadsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Downloads"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
}
