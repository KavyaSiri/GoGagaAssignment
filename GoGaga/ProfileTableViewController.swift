//
//  ProfileTableViewController.swift
//  GoGaga
//
//  Created by Kavya Sri on 24/11/20.
//

import UIKit

class ProfileTableViewController: UITableViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var arrayData : [[String:Any]] =
        [
            ["images": ["puppy0","puppy1","puppy2"]] ,
            
            ["iconImage":"cakeImage",
             "fullName":"siri",
             "age":"25",
             "sign":"aries"],
            
            ["iconImage":"locationImage",
             "cityname":"Kasol"],
            
            ["iconImage":"music",
             "music-Genere": [["genereimage":"puppy0","genereTitle":"dog1"],
                              ["genereimage":"puppy1","genereTitle":"dog1"],
                              ["genereimage":"puppy2","genereTitle":"dog1"],
                              ["genereimage":"puppy1","genereTitle":"dog1"],
                              ["genereimage":"puppy0","genereTitle":"dog1"]
             ]
            ]
        ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        registerCells()
        loadNameCellXib()
        loadLocationXib()
        favouriteTableViewXib()
        
    }
    
    func registerCells(){
        
        let scrollCell = UINib(nibName: "ScrollTableViewCell", bundle: nil)
        self.tableView.register(scrollCell, forCellReuseIdentifier: "ScrollViewCellID")
        
        
    }
    func loadNameCellXib(){
        
        let nameViewCell = UINib(nibName: "NameTableViewCell", bundle: nil)
        self.tableView.register(nameViewCell, forCellReuseIdentifier: "NameTableViewCellID")
    }
    func loadLocationXib(){
        let locationviewCell = UINib(nibName: "LocationTableViewCell", bundle: nil)
        self.tableView.register(locationviewCell, forCellReuseIdentifier: "LocationTableViewCellID")
    }
    func favouriteTableViewXib(){
        let favxib = UINib(nibName: "FavouritesTableViewCell", bundle: nil)
        self.tableView.register(favxib, forCellReuseIdentifier: "FavouritesTableViewCellID")
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayData.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return view.frame.size.height/2 - 30
        }
        else if indexPath.row == 1{
            return 60
        }
        else if indexPath.row == 2 {
            return 60
        }
        else {
            return 100
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row_data = arrayData[indexPath.row]
        
        if(indexPath.row == 0){
            
            
            let arrayImages = row_data["images"] as! Array<String>
            
            let scrollViewCell = tableView.dequeueReusableCell(withIdentifier: "ScrollViewCellID", for: indexPath) as! ScrollTableViewCell
            
            scrollViewCell.imagesArray = arrayImages
            
            return scrollViewCell
            
        }
        
        else if(indexPath.row == 1){
            
            let nameViewCell = tableView.dequeueReusableCell(withIdentifier: "NameTableViewCellID", for: indexPath) as! NameTableViewCell
            
            let totalString = "\(row_data["fullName"] as! String), \(row_data["age"] as! String), \(row_data["sign"] as! String)"
            nameViewCell.labelName.text = totalString
            
            return nameViewCell
        }
        else if(indexPath.row == 2){
            
            let locationViewCell = tableView.dequeueReusableCell(withIdentifier: "LocationTableViewCellID", for: indexPath) as! LocationTableViewCell
            
            locationViewCell.labelLocation.text = row_data["cityname"] as? String
            
            return locationViewCell
            
        }
        else{
            
            let favouriteTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FavouritesTableViewCellID", for: indexPath) as! FavouritesTableViewCell
            
            favouriteTableViewCell.collectionViewInTV.delegate = self
            favouriteTableViewCell.collectionViewInTV.dataSource = self
            
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
            layout.itemSize = CGSize(width: 80 , height: 80)
            layout.minimumInteritemSpacing = 5
            layout.minimumLineSpacing = 5
            layout.scrollDirection = .horizontal
            favouriteTableViewCell.collectionViewInTV.collectionViewLayout = layout
            
            let favxib = UINib(nibName: "FavouritesCollectionViewCell", bundle: nil)
            favouriteTableViewCell.collectionViewInTV.register(favxib, forCellWithReuseIdentifier: "FavouritesCollectionViewCellID")
            
            return favouriteTableViewCell
        }
        
        }
    
    //MARK: - CollectionView delagate amd data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        let row_data = arrayData[3]
        let arrayCollectionElements = row_data["music-Genere"] as! Array<Dictionary<String, String>>
        
        return arrayCollectionElements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let row_data = arrayData[3]
        let arrayCollectionElements = row_data["music-Genere"] as! Array<Dictionary<String, String>>
        
        let collectionVar  = collectionView.dequeueReusableCell(withReuseIdentifier: "FavouritesCollectionViewCellID", for: indexPath) as! FavouritesCollectionViewCell
        
        let dictCollectionElement = arrayCollectionElements[indexPath.row]
        
        let imageName = dictCollectionElement["genereimage"]
        let title = dictCollectionElement["genereTitle"]
        
        collectionVar.favMusicLabels.text = title
        collectionVar.favMusicImages.image = UIImage(named: imageName!)
        
        
        return collectionVar
    }
    
}
