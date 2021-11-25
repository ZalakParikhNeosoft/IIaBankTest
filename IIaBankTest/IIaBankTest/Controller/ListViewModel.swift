//
//  ListViewModel.swift
//  IIaBankTest
//
//  Created by Zalak on 25/11/21.
//

import Foundation

final class ListViewModel {
    
    private var list        : ListModel?
    private var searchList  : ListModel?
    private var type        : ListTypes = .stationery
    
    func numberOfSections() -> Int {
        return 2
    }
    
    func numberOfRows()->Int {
        if let searchList = searchList {
            switch type {
            case.stationery:
                return searchList.stationery.count
            case .signs:
                return searchList.signs.count
            case .mathsSigns:
                return searchList.mathSigns.count
            }
        }else {
            return 0
        }
    }
    
    func detailAtIndexPath(indexPath:IndexPath) -> DetailModel? {
        switch type {
        case.stationery:
            return searchList?.stationery[indexPath.row]
        case .signs:
            return searchList?.signs[indexPath.row]
        case .mathsSigns:
            return searchList?.mathSigns[indexPath.row]
        }
    }
    
    func loadListItems(completion: @escaping () -> ()) {
        list = ListModel(stationery: setStationryData(), signs: setSignsData(), mathSigns: setMathSignsData())
        searchList = list
        completion()
    }
    
    func allListData() -> ListModel? {
        return searchList
    }
    
    func setNewType(_ type: ListTypes) {
        self.type = type
        searchList = list
    }
}

//MARK: - Search
extension ListViewModel {
    
    func searchWith(_ updatedSerachText: String , completion: @escaping () -> ()) {
        updatedSerachText.isEmpty ? searchList = list : createSearchArray(updatedSerachText)
        completion()
    }
    
    private func createSearchArray(_ updatedText : String) {
        
        if let mainList = list {
            switch type {
            case .stationery:
                self.searchList?.stationery =  mainList.stationery.filter({($0.label.trimmed.containsIgnoringCase(find: updatedText))})
            case .signs:
                self.searchList?.signs =  mainList.signs.filter({($0.label.trimmed.containsIgnoringCase(find: updatedText))})
            case .mathsSigns:
                self.searchList?.mathSigns =  mainList.mathSigns.filter({($0.label.trimmed.containsIgnoringCase(find: updatedText))})
            }
        }
    }
}

//MARK: - Set Particular List Data
extension ListViewModel {
    
    private func setStationryData() -> [DetailModel] {
      
        return [ DetailModel(label: "pencil", iconStr: "pencil"),
                 DetailModel(label: "paperclip", iconStr: "paperclip"),
                 DetailModel(label: "bag", iconStr: "bag"),
                 DetailModel(label: "book", iconStr: "book"),
                 DetailModel(label: "music.note", iconStr: "music.note"),
                 DetailModel(label: "printer", iconStr: "printer"),
                 DetailModel(label: "newspaper circle", iconStr: "newspaper.circle"),
                 DetailModel(label: "pencil circle", iconStr: "pencil.circle"),
                 DetailModel(label: "paperclip circle", iconStr: "paperclip.circle"),
                 DetailModel(label: "newspaper circle", iconStr: "newspaper.circle"),
                 DetailModel(label: "eye slash fill", iconStr: "eye.slash.fill"),
                 DetailModel(label: "eye fill", iconStr: "eye.fill"),
                 DetailModel(label: "paperclip circle fill", iconStr: "paperclip.circle.fill"),
                 DetailModel(label: "DropDown", iconStr: "arrowtriangle.down.fill"),
                 DetailModel(label: "Building", iconStr: "building.2.fill"),
                 DetailModel(label: "Lock", iconStr: "lock.fill")]
    }
    
    private func setSignsData() -> [DetailModel] {
       
        return [DetailModel(label: "eye slash fill", iconStr: "eye.slash.fill"),
                DetailModel(label: "eye Fill", iconStr: "eye.fill"),
                DetailModel(label: "pen Fill Circle", iconStr: "arrowtriangle.down.fill")]
    }
    
    private func setMathSignsData() -> [DetailModel] {
        return [DetailModel(label: "Arrow Fill DropDown", iconStr: "arrowtriangle.down.fill"),
                DetailModel(label: "Xyz Lock", iconStr: "lock.fill"),
                DetailModel(label: "pencil Circle1", iconStr: "pencil.circle")]
    }
}
