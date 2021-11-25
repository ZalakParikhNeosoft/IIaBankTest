//
//  ImageTableCell.swift
//  IIaBankTest
//
//  Created by Zalak on 25/11/21.
//

import UIKit

class ImageTableCell: UITableViewCell {
    
    //MARK: - IBOutlets -
    @IBOutlet private weak var imageCollectionView  : UICollectionView!
    @IBOutlet private weak var pageControl          : UIPageControl!
    
    //MARK: - Variables -
    private var imageData = [imageModel]()

    //CallBack
    var visibleRowOfCollectionView: ((imageModel) -> Void)?
    
    //MARK: - Life Cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        setData()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
//MARK: - SetUP Data
extension ImageTableCell {
    
    private func setData() {
        imageData = []
        imageData.append(imageModel(imageStr: "stationery" , type: .stationery))
        imageData.append(imageModel(imageStr: "Signs", type: .signs))
        imageData.append(imageModel(imageStr: "math", type: .mathsSigns))
        
        prepareView()
    }
  
    private func prepareView() {
        pageControl.currentPage = 0
        pageControl.numberOfPages = imageData.count
        updatePageControlUI()
        imageCollectionView.reloadData()
    }

    private func updatePageControlUI() {
        if #available(iOS 14.0, *) {
            pageControl.setIndicatorImage(UIImage(systemName: "dot.circle"), forPage: pageControl.currentPage)
            pageControl.preferredIndicatorImage = UIImage(systemName: "circle")
        }
    }
}

//MARK: - UICollectionView Data Source
extension ImageTableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionCell", for: indexPath) as! ImageCollectionCell
        cell.bgImage = imageData[indexPath.item].image
        return cell
    }
}

//MARK: - UICollectionView Delegate
extension ImageTableCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //15 is left section offset plus 10 is line space and need to show width from total - 20 based on design
        let size = CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
        return size
    }
}

//MARK: - Scrollview
extension ImageTableCell {
    private func setPageAfterScrolling() {
        let visibleRect         = CGRect(origin: imageCollectionView.contentOffset, size: imageCollectionView.bounds.size)
        let visiblePoint        = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = imageCollectionView.indexPathForItem(at: visiblePoint) {
            let indexRow            = visibleIndexPath.row
            if indexRow != pageControl.currentPage {
                pageControl.currentPage = indexRow
                updatePageControlUI()
                visibleRowOfCollectionView?(imageData[indexRow])
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        setPageAfterScrolling()
    }
}

