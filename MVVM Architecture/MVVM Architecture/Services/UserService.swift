//
//  UserService.swift
//  MVVM Architecture
//
//  Created by Raghavendra Mikkilineni on 08/05/21.
//

import Foundation
import Combine
protocol UserSevice {
    func fetchUsers(data: LoadableSubject<[UserPresentationModel]>)
}

struct RealUserService: UserSevice {
    let webRepository: WebRepository
    
    init(webRepository: WebRepository) {
        self.webRepository = webRepository
    }
    
    func fetchUsers(data: LoadableSubject<Array<UserPresentationModel>>) {
        let cancelBag = CancelBag()
        data.wrappedValue.setIsLoading(cancelBag: cancelBag)
        
        webRepository.call(endpoint: UsersEndPoint.users)
            .sinkToLoadable { (result: Loadable<Array<User>>) in
                if let users = result.value {
                    let users = UserPresentationModel.fromLoadableUsers(users)
                    data.wrappedValue = .loaded(users)
                }else {
                    data.wrappedValue = .failed(NetworkError.unknownError)
                }
            }
            .store(in: cancelBag)
    }
}

struct StubUserService: UserSevice {
    func fetchUsers(data: LoadableSubject<[UserPresentationModel]>) {}
}
