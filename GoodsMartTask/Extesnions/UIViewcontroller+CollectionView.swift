//
//  UIViewcontroller+CollectionView.swift
//  GoodsMartTask
//
//  Created by mohamed eltabey on 5/31/22.
//


import Foundation
import UIKit
import Kingfisher


enum moreBtnStatus:String{
    case showMoreBtn, hideMoreBtn
}
enum TypeScrollCollection:String {
    case herizontal,vertical
}

extension UIViewController {    
    func handleSectionCollectionView(inset:CGFloat, sizeWidthItem:CGFloat,sizeHightItem:CGFloat, widthGroup:CGFloat,hightGroup:CGFloat, titleSection:Bool, CountItemsShow:Int, typeScroll: TypeScrollCollection ) -> NSCollectionLayoutSection {
        let insets:CGFloat = inset
        
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(sizeWidthItem), heightDimension: .fractionalHeight(sizeHightItem))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: insets, leading: insets, bottom: insets, trailing: insets)
        
        //group
        let groubSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(widthGroup), heightDimension: .fractionalHeight(hightGroup))
        switch typeScroll {
        case .herizontal:
            let group  = NSCollectionLayoutGroup.horizontal(layoutSize: groubSize, subitem: item, count: CountItemsShow)
            //section
            let section = NSCollectionLayoutSection(group: group)
//            let section = NSCollectionLayoutGroup.vert
            section.orthogonalScrollingBehavior = .groupPaging
            //return section
            if titleSection == true {
                //supplmentary
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(35))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize , elementKind: "Header", alignment: .top)
                section.boundarySupplementaryItems = [header]
                return section
            }else{

                return section
            }
        case .vertical:
            //group
            let groubSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(widthGroup), heightDimension: .fractionalHeight(hightGroup))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groubSize, subitem: item, count: CountItemsShow)
            
            //section
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPaging
            section.supplementariesFollowContentInsets = false
            
            
            if titleSection == true {
                //supplmentary
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(35))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize , elementKind: "Header", alignment: .top)
                section.boundarySupplementaryItems = [header]
                return section
            }else{
                return section
            }
        default:
            print("CollectionCompositional")
        }
        
    }
}


extension UIViewController {
    func setTitleHeaderCollectionView(collectionView:UICollectionView,indexPath:IndexPath,ActionButtonMore:Selector,title:String, section:Int, MoreBtnType:moreBtnStatus) -> UICollectionReusableView{
            guard  let view = collectionView.dequeueReusableSupplementaryView(ofKind: "Header", withReuseIdentifier: "HeaderViewHome", for: indexPath) as?  HeaderViewHome else {return UICollectionReusableView()}
          if  indexPath.section == section  {
                view.title = title
            if MoreBtnType == .showMoreBtn{
                view.titleButton = "See All"
                view.MoreBtn.removeTarget(nil, action: nil, for: .allEvents)
                view.MoreBtn.addTarget(self, action: ActionButtonMore, for: .touchUpInside)
            }else {
                view.MoreBtn.isHidden = true
            }
               
          }
        return view
    }
}

extension UIButton {
    
    func adjustButton(text:String,textColor:UIColor,fontSize:CGFloat){
        self.setTitleColor(textColor, for: .normal)
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = UIFont(name: "", size: fontSize)
    }
}



extension UIImageView{
    func loadImage(With link:String){
        if let url = URL(string:link){
            self.kf.indicatorType = .activity
            self.kf.setImage(with: url,placeholder: UIImage(named:"AppIcon"),options: [.transition(.fade(0.2))])
        }
    }
}

extension UICollectionView {
    
    func registerNib<cell:UICollectionViewCell>(cell:cell.Type){
        let nibName = String(describing: cell)
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
    
    func registerHeader<header:UICollectionReusableView>(header:header.Type){
        let nibName = String(describing: header)
        self.register(UINib(nibName: nibName, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: nibName)
    }
    
}
