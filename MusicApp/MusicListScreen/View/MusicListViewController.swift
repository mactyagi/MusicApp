//
//  ViewController.swift
//  MusicApp
//
//  Created by Manu on 02/06/23.
//

import UIKit

class MusicListViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - properties
    var viewModel: MusicListViewModel = MusicListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        getMusic()
        setupTableView()
        
    }
    
    
    func getMusic(){
        viewModel.getMusicList(comp: { isError in
            DispatchQueue.main.async {
                if isError{
                    // some error dilog
                }else{
                    self.tableView.reloadData()
                }
            }
        })
    }
    
    func setupTableView(){
        tableView.dataSource = self
        tableView.register(UINib(nibName: MusicListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: MusicListTableViewCell.identifier)
    }
}


//MARK: - TableView Data Source
extension MusicListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.music.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MusicListTableViewCell.identifier, for: indexPath) as! MusicListTableViewCell
        cell.setupCell(musicData: viewModel.music[indexPath.row])
        return cell
    }
    
    
}

