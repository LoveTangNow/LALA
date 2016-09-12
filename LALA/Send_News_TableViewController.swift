//
//  Send_News_TableViewController.swift
//  LALA
//
//  Created by Thomas Liu on 16/9/5.
//  Copyright © 2016年 Thomas Liu. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON
import MobileCoreServices

class Send_News_TableViewController: UITableViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    
    // MARK: - BIAN LIANG
    
    var TableViewCell_Height:CGFloat = 0
    
    var Imageload:Image = UIImage(named: "Black.png")!
    var imagePicker     : UIImagePickerController!
    var imagelist = [UIImage]()
    /*
     
     */
    var Words_S:String = ""
    
    // MARK: - FUNCS

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    @IBAction func UIButton_TOPRIGHT_Click(sender: AnyObject) {
        print("a")
        /*获取到的是:
         *          用户的 id、
         *          一段文字(文字需要在 ios 端校验文字数目)、
         *          发送的设备、
         */
        
        //let imageData = UIImageJPEGRepresentation(UIImageView_For_Upload.image!, 1) // 将图片转换成jpeg格式的NSData，压缩到1
        //let imageStr = imageData?.base64EncodedStringWithOptions(.Encoding64CharacterLineLength) // 将图片转换为base64字符串
        var parameters = (senderid :"",words:"",device:"",photonumber:1,photo:[""])
        
        parameters.senderid = "1"
        parameters.words = Words_S
        parameters.photonumber = imagelist.count
        parameters.device = LoadTableViewCells().getDeviceVersion()
        
        if parameters.photonumber > 0 {
            for i in 0..<parameters.photonumber {
                let imageData = UIImagePNGRepresentation(imagelist[i]) // 将图片转换成jpeg格式的NSData，压缩到1
                let imageStr = imageData?.base64EncodedStringWithOptions(.Encoding64CharacterLineLength) // 将图片转换为base64字符串
                parameters.photo[i] = imageStr!
            }
        }

        let parameterss = [
            "senderid":parameters.senderid,
            "words":parameters.words,
            "device":parameters.device,
            "photonumber":parameters.photonumber,
            "photo":parameters.photo[0]
        ]

        Alamofire.request(.POST, "http://localhost:80/LALA/SEND_NEWS_WORD.php", parameters: parameterss as? [String : AnyObject])
//        self.dismissViewControllerAnimated(true, completion:nil)
        print(parameterss)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        let compareResult = CFStringCompare(mediaType as NSString!, kUTTypeMovie, CFStringCompareFlags.CompareCaseInsensitive)
        
        if compareResult == CFComparisonResult.CompareEqualTo {
            let moviePath = info[UIImagePickerControllerMediaURL] as? NSURL
            //获取路径
            let moviePathString = moviePath!.relativePath
            
            if UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(moviePathString!)
            {
                UISaveVideoAtPathToSavedPhotosAlbum(moviePathString!, nil, nil, nil)
            }
            print("视频")
        }
        else {
            print("图片")
            let image = info[UIImagePickerControllerOriginalImage] as? UIImage
            imagelist.append(image!)
            
            self.tableView.reloadData()
            //得到了 image //怎么传达 tableview 的控件上？、
            //self.imageView!.image =  image;
        }
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func initWithImagePickView(type:NSString){
        
        self.imagePicker = UIImagePickerController()
        self.imagePicker.delegate      = self;
        self.imagePicker.allowsEditing = true;
        
        switch type{
        case "拍照":
            self.imagePicker.sourceType = .Camera
        case "相册":
            self.imagePicker.sourceType = .PhotoLibrary
        case "摄像":
            self.imagePicker.sourceType = .Camera
            self.imagePicker.videoMaximumDuration = 60 * 3
            self.imagePicker.videoQuality = .Type640x480
            self.imagePicker.mediaTypes = [String(kUTTypeMovie)]
        default:
            print("error")
        }
        
        self.presentViewController(self.imagePicker, animated: true, completion: nil)
    }
    
    @IBOutlet var UITableView_Main: UITableView!

    @IBAction func XiaLa(sender: AnyObject) {
        print("XL")
        
    }

    @IBAction func ChangAn(sender: AnyObject) {
        print("CA")
    }
    // MARK: - Table view data source
    
    //TableView中有几个Sections
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    //Section中有几行 tableview
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    
    //cell的初始化都在这里了 返回 一个cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        /*
         1、
            1、文字框
            2、图片选择
         2、
            1、地点
            2、分享
         */
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                //文字框
                let cell = tableView.dequeueReusableCellWithIdentifier("SN_WORDS_TableViewCell", forIndexPath: indexPath) as! SN_WORDS_TableViewCell
                // Configure the cell...
                Words_S = cell.UITextView_Main.text
                TableViewCell_Height = 200
                print(Words_S)
                return cell
            }
            else{
                //图片选择
                let cell = tableView.dequeueReusableCellWithIdentifier("SN_PIKEIMAGE_TableViewCell", forIndexPath: indexPath) as! SN_PIKEIMAGE_TableViewCell
                // Configure the cell...
                
                switch imagelist.count {
                case 0:
                    cell.UIImageView1.image = Imageload
                case 1:
                    cell.UIImageView1.image = imagelist[0]
                case 2:
                    cell.UIImageView1.image = imagelist[0]
                    cell.UIImageView2.image = imagelist[1]
                case 3:
                    cell.UIImageView1.image = imagelist[0]
                    cell.UIImageView2.image = imagelist[1]
                    cell.UIImageView3.image = imagelist[2]
                default:
                    cell.UIImageView1.image = imagelist[0]
                    cell.UIImageView2.image = imagelist[1]
                    cell.UIImageView3.image = Imageload
                }
                
                TableViewCell_Height = UIScreen.mainScreen().bounds.width / 3 + 42
                
                return cell
            }
        }
        else{
            if indexPath.row == 0 {
                //选取地点
                let cell = tableView.dequeueReusableCellWithIdentifier("SN_PIKELOCA_TableViewCell", forIndexPath: indexPath) as! SN_PIKELOCA_TableViewCell
                // Configure the cell...
                
                TableViewCell_Height = 44
                
                return cell
            }
            else{
                //分享
                let cell = tableView.dequeueReusableCellWithIdentifier("SN_SHARE_TableViewCell", forIndexPath: indexPath) as! SN_SHARE_TableViewCell
                // Configure the cell...
                
                cell.UIImageView1.image = Imageload
                
                TableViewCell_Height = 60
                
                return cell
            }
        }
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //self.resignFirstResponder()
        self.tableView.reloadData()
        if indexPath.section == 0 && indexPath.row == 1 {
            
            let actionSheetController: UIAlertController = UIAlertController(title: "请选择", message:nil, preferredStyle: .ActionSheet)
            
            //取消按钮
            let cancelAction: UIAlertAction = UIAlertAction(title: "取消", style: .Cancel) { action -> Void in
                //Just dismiss the action sheet
            }
            //拍照
            let takePictureAction: UIAlertAction = UIAlertAction(title: "拍照", style: .Default){ action -> Void in
                self .initWithImagePickView("拍照")
            }
            //相册选择
            let choosePictureAction: UIAlertAction = UIAlertAction(title: "相册", style: .Default){ action -> Void in
                self .initWithImagePickView("相册")
            }
            //摄像
            let moviePictureAction: UIAlertAction = UIAlertAction(title: "摄像", style: .Default){ action -> Void in
                self .initWithImagePickView("摄像")
            }
            
            actionSheetController.addAction(cancelAction)
            actionSheetController.addAction(takePictureAction)
            actionSheetController.addAction(choosePictureAction)
            actionSheetController.addAction(moviePictureAction)
            
            self.presentViewController(actionSheetController, animated: true, completion: nil)
        }
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        //print("Tableview cell高度")
        return TableViewCell_Height
    }
}
