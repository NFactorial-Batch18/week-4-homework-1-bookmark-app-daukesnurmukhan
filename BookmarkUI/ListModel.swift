//
//  ListModel.swift
//  BookmarkUI
//
//  Created by Нұрмұхан Дәукес on 18.05.2022.
//

import Combine

final class ListModel: ObservableObject {
    @Published var title: String = ""
    @Published var link : String = ""
}
