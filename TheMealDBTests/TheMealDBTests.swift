//
//  TheMealDBTests.swift
//  TheMealDBTests
//
//  Created by andres paladines on 1/31/24.
//

import XCTest
@testable import TheMealDB

final class TheMealDBTests: XCTestCase {

    var dessertsViewModel: DessertsViewModel!
    
    override func setUpWithError() throws {
        dessertsViewModel = DessertsViewModel(networkManager: FakeNetworkManager())
    }

    override func tearDownWithError() throws {
        dessertsViewModel = nil
    }

    func testApiCallOk() {
        //Given
        let fakeNetworkManager = FakeNetworkManager()
        fakeNetworkManager.useCase = .fullList
        dessertsViewModel = DessertsViewModel(networkManager: fakeNetworkManager)
        
        //When
        dessertsViewModel.getMealsBy("Beef")
        let expectation = XCTestExpectation(description: "Fetching Meals list with correct data")
        let waitDuration = 1.0

        //Then
        DispatchQueue.main.async {
            XCTAssertNotNil(self.dessertsViewModel)
            XCTAssertEqual(self.dessertsViewModel.mealPreviewsList.count, 4)
            XCTAssertNil(self.dessertsViewModel.customError)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: waitDuration)
    }
    
    func testApiCallEmptyList() {
        //Given
        let fakeNetworkManager = FakeNetworkManager()
        fakeNetworkManager.useCase = .emptyList
        dessertsViewModel = DessertsViewModel(networkManager: fakeNetworkManager)

        //When
        dessertsViewModel.getMealsBy("Beef")
        let expectation = XCTestExpectation(description: "Fetching Meals with empty list")
        let waitDuration = 1.0

        //Then
        DispatchQueue.main.async {
            XCTAssertNotNil(self.dessertsViewModel)
            XCTAssertEqual(self.dessertsViewModel.mealPreviewsList.count, 0)
            XCTAssertNotNil(self.dessertsViewModel.customError)
            XCTAssertEqual(self.dessertsViewModel.customError, .dataNotFoundError)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: waitDuration)
    }
    
    func testApiCallWrongData() {
        //Given
        let fakeNetworkManager = FakeNetworkManager()
        fakeNetworkManager.useCase = .wrongData
        dessertsViewModel = DessertsViewModel(networkManager: fakeNetworkManager)

        //When
        dessertsViewModel.getMealsBy("Beef")
        let expectation = XCTestExpectation(description: "Fetching Meals list with wrong response data")
        let waitDuration = 1.0

        //Then
        DispatchQueue.main.async {
            XCTAssertNotNil(self.dessertsViewModel)
            XCTAssertEqual(self.dessertsViewModel.mealPreviewsList.count, 0)
            XCTAssertNotNil(self.dessertsViewModel.customError)
            XCTAssertEqual(self.dessertsViewModel.customError, .parsingError)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: waitDuration)
    }
    
    func testApiCallTimeout() {
        //Given
        let fakeNetworkManager = FakeNetworkManager()
        fakeNetworkManager.useCase = .timeout
        dessertsViewModel = DessertsViewModel(networkManager: fakeNetworkManager)
        
        //When
        dessertsViewModel.getMealsBy("Beef")
        let expectation = XCTestExpectation(description: "Fetching Meals list with timeOut Error")
        let waitDuration = 1.0
        
        //Then
        DispatchQueue.main.async {
            XCTAssertNotNil(self.dessertsViewModel)
            XCTAssertEqual(self.dessertsViewModel.mealPreviewsList.count, 0)
            XCTAssertNotNil(self.dessertsViewModel.customError)
            XCTAssertEqual(self.dessertsViewModel.customError, .timeOutError)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: waitDuration)
    }
        

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
