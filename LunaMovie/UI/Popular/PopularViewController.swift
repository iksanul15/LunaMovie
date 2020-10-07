//
//  PopularViewController.swift
//  LunaMovie
//
//  Created by Muhammad Iksanul on 05/10/20.
//

import UIKit
import RxSwift
import RxCocoa

private let reuseIdentifier = "MovieCell"

class PopularViewController: UIViewController, UITableViewDelegate {
    
    let disposeBag = DisposeBag()
    private var popularViewModel: PopularViewModel! = PopularViewModel()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let _ = MovieService.shared.fetchPopularMovie()
        //            .subscribe(
        //                onNext: { response in
        //                    print("Response: \(response)")
        //                    self.movies = response.results
        //                }, onError: { error in
        //                    print("Error \(error)")
        //                }).disposed(by: disposeBag)
        
        popularViewModel.fetchPopularMovie()
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: reuseIdentifier, cellType: MovieViewCell.self)) { index, viewModel, cell in
                
                cell.movieTitle.text = viewModel.title
                cell.poster.image = UIImage(named: "photo.on.rectangle")
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: "https://image.tmdb.org/t/p/w500/\(viewModel.poster)".asURL()) {
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                cell.poster.image = image
                            }
                        }
                    }
                }
                
                cell.dateLabel.text = viewModel.date
                cell.rateLabel.text = "Rating: \(viewModel.rate)"
                cell.overview.text = viewModel.overview
            }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(MovieViewModel.self).subscribe(onNext: { movie in
            print(movie.title)
            if let detailVC = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "DetailPage") as? DetailViewController {
                
                detailVC.movieViewModel = movie
                self.navigationController?.pushViewController(detailVC, animated: true)
                
            }
        }).disposed(by: disposeBag)
    }
    
}
