//
//  SearchViewModel.swift
//  SearchApps
//
//  Created by J Oh on 8/10/24.
//

import Foundation
import RxSwift
import RxCocoa

final class SearchViewModel {
    
    let disposeBag = DisposeBag()
    
    func transform(input: Input) -> Output {
        let apppList = PublishSubject<[Appp]>()
        
        input.searchButtonTap
            .withLatestFrom(input.searchText)
            .distinctUntilChanged()
            .flatMap { value in // (map) vs (flatMap)
                NetworkManager.shared.request(term: value)
            }
            .subscribe(with: self, onNext: { owner, appp in
                apppList.onNext(appp.results)
            }, onError: { owner, error in
                print(error)
            }, onCompleted: { _ in
                print("completed")
            }, onDisposed: { _ in
                print("disposed")
            })
            .disposed(by: disposeBag)
        
        input.searchText
            .subscribe(with: self) { owner, value in
                print("Search: \(value)")
            }
            .disposed(by: disposeBag)
        
        
        return Output(apppList: apppList)
    }
    
}

extension SearchViewModel {
    struct Input {
        let searchText: ControlProperty<String>
        let searchButtonTap: ControlEvent<Void>
    }
    
    struct Output {
        let apppList: Observable<[Appp]>
    }
}
