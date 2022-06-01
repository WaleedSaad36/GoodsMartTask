//
//  HomeVC.swift
//  GoodsMartTask
//
//  Created by mohamed eltabey on 5/31/22.
//

import UIKit
protocol HomeVCProtocol:class {
    func showLoader()
    func hideLoader()
    func reloadColletionView()
}

class HomeVC: UIViewController {
    //MARK:- OutLets
    @IBOutlet var homeView: HomeView!
    
    //MARK:- Private Properties
    private var viewModel:HomeVMProtocol?
    private var previousOffset:CGFloat = 0.0
    private var currentPage = 0
    
    //MARK:- Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = HomeViewModel.init(view: self)
        self.viewModel?.getHomeDataAPI()
        setupConfigrationCollectionView()
    }
    
    class func create() -> HomeVC {
        let homeVC: HomeVC = HomeVC.create(storyboardName: Storyboards.main, identifier: "\(HomeVC.self)")
        homeVC.viewModel = HomeViewModel(view: homeVC) as! HomeVMProtocol
        return homeVC
    }
    
    
    private func setupConfigrationCollectionView(){
        self.homeView.collectionView.delegate = self
        self.homeView.collectionView.dataSource = self
        homeView.collectionView.register(UINib(nibName: "HeaderViewHome", bundle: nil), forSupplementaryViewOfKind: "Header", withReuseIdentifier: "HeaderViewHome")
        homeView.collectionView.registerNib(cell: ArticleCell.self)
        self.homeView.collectionView.collectionViewLayout = CreatecompositionalLayout()
    }
    
    //MARK:- handle collectionView LayOut Compostional
    private func  CreatecompositionalLayout() -> UICollectionViewCompositionalLayout {
      
        func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
            guard let cv = homeView.collectionView else {
                return targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
            }
            let itemCount = cv.numberOfItems(inSection: 2)
            if previousOffset > cv.contentOffset.x && velocity.x < 0.0{
                currentPage = max(-1, 0)
                
            }else if previousOffset < cv.contentOffset.x && velocity.x > 0.0{
                currentPage = min(currentPage-1, itemCount-1)
            }
                           return CGPoint(x: 0, y: proposedContentOffset.y)
        }
        
        let layout = UICollectionViewCompositionalLayout { [weak self] index , environment  -> NSCollectionLayoutSection?  in
        return self?.createSectionFor(index: index, environment: environment)
        }
        return layout
    }
    //MARK:- handle Section Compostional

    private func createSectionFor(index:Int, environment:NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection{
        switch index{
        case 0 :
            return firstSection()
        case 1 :
            return secondSection()
        default:
            return firstSection()
        }
    }
    private func firstSection() -> NSCollectionLayoutSection{

        return handleSectionCollectionView(inset: 2.5, sizeWidthItem: 1, sizeHightItem: 1, widthGroup: 0.87, hightGroup: 0.4, titleSection: true, CountItemsShow: 1, typeScroll: .vertical)
    }
    
    private func secondSection() -> NSCollectionLayoutSection{
        return handleSectionCollectionView(inset: 2.5, sizeWidthItem: 1, sizeHightItem: 1, widthGroup: 1, hightGroup: 0.6, titleSection: true, CountItemsShow: 1, typeScroll: .vertical)
    }
    
    @objc func moreBtnEmpty(){

    }
}
extension HomeVC:HomeVCProtocol{
    func showLoader() {
        self.homeView.showLoading()
    }
    
    func hideLoader() {
        self.homeView.hideLoading()
    }
    
    func reloadColletionView() {
        self.homeView.collectionView.reloadData()
    }
}
extension HomeVC:UICollectionViewDelegate{
    
}
extension HomeVC:UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel?.getCountArticles() ?? 0
        }else if section == 1 {
            return viewModel?.getCountArticles() ?? 0
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        if indexPath.section == 0{
            if let data = viewModel?.getItemArticles(for: indexPath.item) {
                cell.configerCell(data: data)
                //cell.descLbl.removeFromSuperview()
                return cell
            }
        }else if indexPath.section == 1 {
            if let data = viewModel?.getItemArticles(for: indexPath.item) {
                cell.configerCellMoreArtical(data: data)
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            return  setTitleHeaderCollectionView(collectionView: homeView.collectionView, indexPath: indexPath, ActionButtonMore: #selector(moreBtnEmpty), title: "Last News", section: 0, MoreBtnType: .hideMoreBtn)
        }else if indexPath.section == 1 {
            return setTitleHeaderCollectionView(collectionView: homeView.collectionView, indexPath: indexPath, ActionButtonMore: #selector(moreBtnEmpty), title: "More News", section: 1, MoreBtnType: .hideMoreBtn)
        }else{
            return setTitleHeaderCollectionView(collectionView: homeView.collectionView, indexPath: indexPath, ActionButtonMore: #selector(moreBtnEmpty), title: "Last News", section: 0, MoreBtnType: .hideMoreBtn)
        }
    }
}

