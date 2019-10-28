//
//  ViewController.swift
//  DemoApp
//
//  Created by MAC on 27/10/2019.
//  Copyright © 2019 EdJordan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func jsonData(){
        guard let path = Bundle(for: type(of: self)).path(forResource: "APIbooks", ofType: "json") else {
            print("FAIL path")
            return
        }
        do{
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            let bookCollection = try decoder.decode(BookCollection.self, from:data)
            print("bookCollection",bookCollection)
//            let firstBook = bookCollection.item?.first!
//           // print("firstBook",firstBook)
//
//            print("title-->",firstBook?.title as Any)
//            print("bookId-->",firstBook?.bookId as Any)
            
        }catch{
            print("Error")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         jsonData()
    }


}

