//
//  ScrollTableViewCell.swift
//  GoGaga
//
//  Created by Kavya Sri on 24/11/20.
//

import UIKit

class ScrollTableViewCell: UITableViewCell, UIScrollViewDelegate {

    var imagesArray = [""]
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var displayView: UIView!
    
    var contentwidth :CGFloat = 0.0
    
    override func layoutSubviews() {
        
        scrollView.delegate = self
        
        for index in 0...imagesArray.count-1 {
            
            let imageName = imagesArray[index]
            let imageViewObject = UIImageView(image: UIImage(named: imageName))
            
            contentwidth  += self.frame.width
            
            imageViewObject.frame = CGRect(x: self.frame.width*CGFloat(index), y: 0, width: self.frame.width, height: self.frame.height)
            imageViewObject.contentMode = .scaleAspectFit
            scrollView.addSubview(imageViewObject)
            
        }
        
        let image = UIImage(named: "editProfile") as UIImage?
        let button   = UIButton(type: UIButton.ButtonType.custom) as UIButton
        button.frame = CGRect(x: self.frame.width - (30 + 20), y: 10, width: 30, height: 30)
        button.setBackgroundImage(image, for: .normal)
        displayView.addSubview(button)
        
        scrollView.contentSize = CGSize(width: contentwidth, height: self.frame.height)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset)
        
        pageControl.currentPage = Int(scrollView.contentOffset.x / CGFloat(self.frame.width))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
