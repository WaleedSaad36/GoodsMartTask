//
//  HomeViewModel.swift
//  GoodsMartTask
//
//  Created by mohamed eltabey on 5/31/22.
//

import Foundation


protocol HomeVMProtocol:class{
    func getHomeDataAPI()
    func getCountArticles() -> Int
    func getItemArticles(for item:Int) -> Article?
}
class HomeViewModel{
    
    //Properties
    private var view:HomeVCProtocol?
    private var articleArray:[Article]?
    
    //initializar
    init(view:HomeVCProtocol) {
        self.view = view
    }
    
    
}

extension HomeViewModel:HomeVMProtocol{
    func getHomeDataAPI() {
        APIManager.HomeArticle { (result) in
            switch result{
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let data):
                DispatchQueue.main.async {
                    self.articleArray = data.articles
                    print("dataArtical >>> \(data.articles)")
                    self.view?.reloadColletionView()
                }
            }
        }
    }
    
    func getCountArticles() -> Int {
        return self.articleArray?.count ?? 0
    }
    
    func getItemArticles(for item: Int) -> Article? {
        return self.articleArray?[item]
    }
}
