//
//  MovieCollectionViewCell.swift
//  Movie
//
//  Created by Baidetskyi Jurii on 19.09.2022.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    // MARK:  @IBOutlet
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameMovieLabel: UILabel!
    @IBOutlet weak var movieType: UILabel!
    @IBOutlet weak var dateMovie: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
