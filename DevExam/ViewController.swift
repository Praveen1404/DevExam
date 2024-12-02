//
//  ViewController.swift
//  DevExam
//
//  Created by Praveen Kumar Murugesan  on 02/12/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var floatingButton: UIButton!
    
    let images: [UIImage] = [
        UIImage(named: "car")!,
        UIImage(named: "bike")!,
        UIImage(named: "bus")!,
        UIImage(named: "truck")!
    ]
    
    var listItemsByImage: [[String]] = [
        ["Audi", "BMW", "Ferrari", "Lamborgini"],
        ["Yamaha", "Harley Davidson","BMW"],
        ["Volvo", "Flix", "Tata"],
        ["Tata", "Benz", "Eicher"]
    ]
    var filteredListItems: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredListItems = listItemsByImage[0]
        
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        collectionView.layer.cornerRadius = 25
        collectionView.layer.masksToBounds = true
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 1
        }
        
        collectionView.isPagingEnabled = true
    }
    
    // MARK: - UICollectionViewDataSource methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImagesCollectionViewCell", for: indexPath) as! ImagesCollectionViewCell
        cell.imageView.image = images[indexPath.item]
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    // MARK: - UIScrollViewDelegate methods
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        updateListForCurrentPage(page: page)
    }
    
    // MARK: - Update List Based on Current Page
    func updateListForCurrentPage(page: Int) {
        if page < listItemsByImage.count {
            filteredListItems = listItemsByImage[page]
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredListItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! TableViewCell
        cell.cellImage?.image = images[indexPath.item]
        cell.cellTitle?.text = filteredListItems[indexPath.item]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - UISearchBarDelegate methods
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let currentPage = collectionView.indexPathsForVisibleItems.first?.item {
            filteredListItems = searchText.isEmpty ? listItemsByImage[currentPage] : listItemsByImage[currentPage].filter { $0.lowercased().contains(searchText.lowercased())
            }
        }
        tableView.reloadData()
    }
}

