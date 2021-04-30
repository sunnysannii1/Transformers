//
//  TransformersTests.swift
//  TransformersTests
//
//  Created by Ahsan Ali on 30/04/2021.
//

import XCTest
@testable import Transformers
class TransformersTests: XCTestCase {
    
    var starter:StartViewModel!
    var listViewModel:TransformerListViewModel!
    var addViewModel:AddTransformerViewModel!
    
    override  func setUp() {
        super.setUp()
        listViewModel = TransformerListViewModel()
        
    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        listViewModel = TransformerListViewModel()
    }

    override func tearDownWithError() throws {
        listViewModel = nil
        starter = nil
        try super.tearDownWithError()
    }

    func testTransformersList(){
        
        listViewModel.getList()
        listViewModel.bindViewTransformersToController = { items in
           
            XCTAssert(items.count > 0,"SUCCESS")
        }
    }
    
    func testSpark(){
        //CALL SPARK API
        starter = StartViewModel()
        starter.bindViewModelToController = {
            XCTAssert(USER.shared.token != "")
        }
    }

    func testADD(){
        
        let tranformer = Transformer(courage: 10, endurance: 10, firepower: 9, id: "\(Date())", intelligence: 8, name: "Rocksain", rank: 7, skill: 9, speed: 5, strength: 4, team: "A", teamIcon: "")
        
        addViewModel = AddTransformerViewModel(bot: tranformer)
    }
    
    func testUpdate(){
        
        let tranformer = Transformer(courage: 10, endurance: 10, firepower: 9, id: "\(Date())", intelligence: 8, name: "Rocksain", rank: 7, skill: 9, speed: 5, strength: 4, team: "A", teamIcon: "")
        
        addViewModel = AddTransformerViewModel(bot: tranformer,isUpdate: true)
    }
    
    
}
