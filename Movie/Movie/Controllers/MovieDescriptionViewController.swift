//
//  MovieDescriptionViewController.swift
//  Movie
//
//  Created by Baidetskyi Jurii on 19.09.2022.
//

import UIKit

class MovieDescriptionViewController: UIViewController {
    
    // MARK: @IBOutlet
    
    @IBOutlet weak var blurImageMovie: UIImageView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieTypeLabel: UILabel!
    @IBOutlet weak var movieDateLabel: UILabel!
    
    // MARK: movie array
    var movie: Movie!
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        installData(movie: movie)
        
    }
    
    // MARK:  private func
    
    private func installData(movie: Movie) {
        self.movieImage.downloaded(from: URL(string: movie.imgPath!)!)
        self.blurImageMovie.downloaded(from: URL(string: movie.imgPath!)!)
        self.blurImageMovie.contentMode = .scaleAspectFill
        self.movieNameLabel.text = movie.name
        self.movieTypeLabel.text = movie.type
        self.movieDateLabel.text = movie.duration
    }
}
