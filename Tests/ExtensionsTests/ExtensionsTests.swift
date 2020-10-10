import XCTest
@testable import Extensions

final class ExtensionsTests: XCTestCase {

    func testArrayExtension() {
        /// make sure the `element` function returns the right element
        XCTAssertTrue([0].element(at: 0) == 0)
        let emptyArray = Array<Int>()
        /// trying to subscript an element that doesn't exist;
        /// normally this results in a fatal error `Index out of range` but `element` function shuld return nil instead
        let element = emptyArray.element(at: 0)
        XCTAssertNil(element)
    }

    func testCollectionSubscript() {
        /// make sure that accessing an index out of range in an `Array` returns `nil`
        XCTAssertNil([0, 1, 2][safe: 3])
        /// make sure that accessing an index out of range in a `Range` returns `nil`
        XCTAssertNil((0 ..< 2)[safe: 3])
    }

    func testSum() {
        XCTAssert([0, 1, 2].sum == 3)
    }

    func testProduct() {
        XCTAssert([1, 2, 3].product == 6)
    }

    func testAverage() {
        XCTAssert([1.0, 2.0, 3.0, 4.0].average == 2.5)
    }

    func testNone() {
        XCTAssert([1, 2, 3, -1, -2, -3].none { $0 > 0 } == false)
        XCTAssert([-1, -2, -3].none { $0 > 0 } == true)
    }

    func testOperators() {
        let rowCount: Int = 5
        let height: CGFloat = 20
        let _ = height * rowCount
        /// we just want to make sure that this compiles
    }

    #if os(macOS)
    func testTimes() {
        /// no more `_` `{ _ in return NSButton()  }`
        let button = 5.times.map { NSButton() }
        XCTAssert(button.count == 5)
    }
    #endif

    #if !os(macOS)
    func testTimes() {
        /// no more `_` `{ _ in return NSButton()  }`
        let button = 5.times.map { UIButton() }
        XCTAssert(button.count == 5)
    }
    #endif

    func testCountWhere() {
        XCTAssert([1, 2, 3, -1, -2, -3].count(where: { $0 > 0 }) == 3)
    }

    func testUniqueness() {
        let unique = [1, 1, 2, 2, 3, 3, 4, 4].uniqueElements()
        print(unique)
    }

    func testSortedOn() {
        let sorted = [5, 4, 3, 2, 1].sorted(on: { $0 })
        XCTAssert(sorted == [1, 2, 3, 4, 5])
    }

    func testChunks() {
        let numbers = [1, 2, 3, 4, 5, 6, 7]
        let chunked = numbers.chunks(size: 3)
        XCTAssert(chunked == [[1, 2, 3], [4, 5, 6], [7]])
    }

    static var allTests = [
        ("testArrayExtension", testArrayExtension),
        ("testCollectionSubscript", testCollectionSubscript),
        ("testSum", testSum),
        ("testProduct", testProduct)
    ]
}
