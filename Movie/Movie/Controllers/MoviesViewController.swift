//
//  ViewController.swift
//  Movie
//
//  Created by Baidetskyi Jurii on 19.09.2022.
//

import UIKit

class MoviesViewController: UIViewController {
    
    // MARK: movies array
    var movies = [Movie]()
    
    // MARK: custom cellIdentifier
    let cellIdentifier = "MovieCollectionViewCell"
    
    // MARK: moviesCollectionView @IBOutlet
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesCollectionView.dataSource = self
        moviesCollectionView.delegate = self
        
        
        moviesCollectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        
        loadFromUrl()
    }
    
    // MARK:  private func
    
    private func loadFromUrl() {
        
        NetworkManager.shared.loadAllMoviesData() { response in
            switch response {
            case .succes(let movies):
                self.movies = movies
                DispatchQueue.main.async {
                    self.moviesCollectionView.reloadData()
                }
            case .error(let error):
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error",
                                                  message: error,
                                                  preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK",
                                                  style: .default))
                    
                    self.present(alert, animated: true)
                }
            }
        }
    }
}
      // MARK: extension MoviesViewController: UICollectionViewDelegate

extension MoviesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "MovieDescriptionViewController") as? MovieDescriptionViewController else {
            return
        }
        
        let movie = movies[indexPath.row]
        vc.movie = movie
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

     // MARK: extension MoviesViewController: UICollectionViewDataSource
extension MoviesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = moviesCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell() }
        
        let movie = self.movies[indexPath.row]
        
        cell.dateMovie.text = movie.duration
        cell.movieImageView.downloaded(from: URL(string: movie.imgPath!)!)
        cell.movieImageView.contentMode = .scaleAspectFill
        cell.movieType.text = movie.type
        cell.nameMovieLabel.text = movie.name
        
        return cell
    }
}
    // MARK: extension MoviesViewController: UICollectionViewDelegateFlowLayout

extension MoviesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 190, height: 340)
    }
}
