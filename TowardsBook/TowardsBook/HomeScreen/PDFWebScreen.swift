//
//  PDFWebScreen.swift
//  TowardsBook
//
//  Created by Maheen on 17/12/2022.
//

import UIKit
import PDFKit

class PDFWebScreen: UIViewController {

    var urlString : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pdfview : PDFView = PDFView(frame: self.view.frame)
        self.view.addSubview(pdfview)
        
        let url : URL = URL(string: self.urlString)!
        
        if let pdfDoc = PDFDocument(url: url) {
            pdfview.displayMode = .singlePageContinuous
            pdfview.autoScales = true
            pdfview.displayDirection = .vertical
            pdfview.document = pdfDoc
        }
    }
}
