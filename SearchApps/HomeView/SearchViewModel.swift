//
//  SearchViewModel.swift
//  SearchApps
//
//  Created by J Oh on 8/10/24.
//

import Foundation
import RxSwift
import RxCocoa

final class SearchViewModel: BaseViewModel {
    
    let disposeBag = DisposeBag()
    
    func newTransform(input: Input) -> SingleOutput {
        
        let result = input.searchButtonTap
            .withLatestFrom(input.searchText)
            .flatMap { term in
                NetworkManager.shared.requestSingle(term: term)
                    .catch { error in
                        return Single<SearchResponse>.never()
                    }
            }
            .asDriver(onErrorJustReturn: SearchResponse(results: []))
            .debug("Button Tap")
        
        return SingleOutput(apppList: result)
    }
    
    func transform(input: Input) -> Output {
        let apppList = PublishSubject<[Appp]>()
        
        input.searchText
            .subscribe(with: self) { owner, value in
                print("Search: \(value)")
            }
            .disposed(by: disposeBag)
        
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
    
    struct SingleOutput {
        let apppList: Driver<SearchResponse>
    }
}

protocol BaseViewModel {
    
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
    
}
