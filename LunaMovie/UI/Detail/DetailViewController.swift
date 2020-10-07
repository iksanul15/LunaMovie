//
//  DetailViewController.swift
//  LunaMovie
//
//  Created by Muhammad Iksanul on 07/10/20.
//

import UIKit
import RxSwift
import RxCocoa

class DetailViewController: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var overview: UILabel!
    
    let disposeBag = DisposeBag()
    private var detailViewModel: DetailViewModel! = DetailViewModel()
    
    var movieViewModel: MovieViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = movieViewModel.title
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: "https://image.tmdb.org/t/p/w500/\(self.movieViewModel.backdrop)".asURL()) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.posterImageView.image = image
                    }
                }
            }
        }
        dateLabel.text = movieViewModel.date
        rateLabel.text = "Rating: \(movieViewModel.rate)"
        overview.text = movieViewModel.overview
        
        //        detailViewModel.fetchDetailMovie(id: movieViewModel.id)
        //            .observeOn(MainScheduler.instance)
        //            .subscribe(onNext: { movieDetailViewModel in
        //                self.titleLabel.text = movieDetailViewModel.title
        //                DispatchQueue.global().async {
        //                    if let data = try? Data(contentsOf: "https://image.tmdb.org/t/p/w500/\(movieDetailViewModel.backdrop)".asURL()) {
        //                        if let image = UIImage(data: data) {
        //                            DispatchQueue.main.async {
        //                                self.posterImageView.image = image
        //                            }
        //                        }
        //                    }
        //                }
        //            })
        
        // Do any additional setup after loading the view.
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
