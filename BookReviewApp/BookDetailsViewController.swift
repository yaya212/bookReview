//
//  BookDetailsViewController.swift
//  BookReviewApp
//
//  Created by Yahya Emad on 19/07/2022.
//

import UIKit

class BookDetailsViewController: UIViewController {
    
    var bookTitle: String?
    var bookImage: UIImage?
    var bookDescription: String?
    var dateCreated: String?
    var purchaseURL1: String?
    var purchaseURL2: String?
    
    
    //MARK: - Outlets
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookDescriptionLabel: UILabel!
    @IBOutlet weak var bookDateCreatedLabel: UILabel!
    @IBOutlet weak var bookAmazonURLLabel: UILabel!
    @IBOutlet weak var bookAppleBooksURLLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        bookTitleLabel.text = bookTitle
        bookImageView.image = bookImage
        bookDescriptionLabel.text = bookDescription
        bookDateCreatedLabel.text = dateCreated
        bookAmazonURLLabel.text = purchaseURL1
        bookAppleBooksURLLabel.text = purchaseURL2
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
