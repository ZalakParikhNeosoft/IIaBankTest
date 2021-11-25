//
//  ListViewController.swift
//  IIaBankTest
//
//  Created by Zalak on 25/11/21.
//

import UIKit

class ListViewController: UIViewController {
    
    //MARK: - IBOutlets -
    @IBOutlet private weak var listTableView: UITableView!
    
    //MARK: - Variables -
    private lazy var viewModel = ListViewModel()
    
    //MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpData()
    }
    
    private func setUpData() {
        DispatchQueue.main.async {
            self.viewModel.loadListItems  {
                self.setupUI()
            }
        }
    }
    
    private func setupUI(){
        listTableView.reloadData()
    }
}

//MARK: - UITableView DataSource -
extension ListViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return viewModel.numberOfRows()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableCell", for: indexPath) as! ImageTableCell
            cell.visibleRowOfCollectionView = { imageData in
                self.viewModel.setNewType(imageData.type)
                tableView.reloadSections(IndexSet(integer: 1), with: .none)
            }
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableCell", for: indexPath) as! ListTableCell
            if let detailData = viewModel.detailAtIndexPath(indexPath: indexPath) {
                cell.setData(detailData)
            }
            return cell
        }
    }
}

//MARK: - UITableView Delegate -
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let searchView = SearchView.shared
            searchView.frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 60)
            searchView.searchText = { (searchText) in
                self.viewModel.searchWith(searchText) {
                    tableView.reloadData()
                }
            }
            return searchView
        }else {
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 60
        }else {
            return 1
        }
    }
}
