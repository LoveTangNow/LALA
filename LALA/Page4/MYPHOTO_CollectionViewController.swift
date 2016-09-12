//
//  MYPHOTO_CollectionViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/11.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

private let reuseIdentifier = "Cell"

class MYPHOTO_CollectionViewController: UICollectionViewController {
    
    var Imageload:Image = UIImage(named: "Black.png")!
    var Imageloadw:Image = UIImage(named: "White.png")!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 50
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AIMAGE_CollectionViewCell", forIndexPath: indexPath) as! AIMAGE_CollectionViewCell

        if indexPath.row % 2 == 0 {
            cell.UIImageView_Main.image = Imageload
        } else {
            cell.UIImageView_Main.image = Imageloadw
        }
        return cell
    }
    
    //cell 大小
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if  indexPath.row % 2 == 1{
            return CGSize(width: 150, height: 150)
        }
        else{
            return CGSize(width: 150, height: 150)
        }  
    }

}
