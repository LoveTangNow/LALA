//
//  TuijianViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/12.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit
import AlamofireImage

class TuijianViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UITableViewDataSource , UITableViewDelegate{
    
    @IBOutlet weak var UICollectionView_Users: UICollectionView!
    @IBOutlet weak var UITableView_Main: UITableView!
    
    var Imageload:Image = UIImage(named: "Black.png")!
    var Imageloadw:Image = UIImage(named: "White.png")!

    override func viewDidLoad() {
        super.viewDidLoad()
        UICollectionView_Users.delegate = self
        UICollectionView_Users.dataSource = self
        
        UITableView_Main.delegate = self
        UITableView_Main.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: - TableView
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 15
        default:
            return 0
        }
    }
    

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 5
        default:
            return 3
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("OnePhotoTwoLabelTableViewCell", forIndexPath: indexPath) as! OnePhotoTwoLabelTableViewCell
        // Configure the cell...
        
        cell.UIImageView_Main.image  = Imageload
        cell.UILabel_Title.text = "Title"
        cell.UILabel_Detail.text = "Detail'"
        
        return cell
    }
    
    
    //MARK: - collectionView
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("UsersCollectionViewCell", forIndexPath: indexPath) as! UsersCollectionViewCell
        
        if indexPath.row % 2 == 0 {
            cell.UIImageView_M.image = Imageload
        } else {
            cell.UIImageView_M.image = Imageloadw
        }
        return cell
    }

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 100   , height: 100)

    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    


}
