# PropertyDecoder

[![CI Status](https://img.shields.io/travis/podul/PropertyDecoder.svg?style=flat)](https://travis-ci.org/podul/PropertyDecoder)
[![Version](https://img.shields.io/cocoapods/v/PropertyDecoder.svg?style=flat)](https://cocoapods.org/pods/PropertyDecoder)
[![License](https://img.shields.io/cocoapods/l/PropertyDecoder.svg?style=flat)](https://cocoapods.org/pods/PropertyDecoder)
[![Platform](https://img.shields.io/cocoapods/p/PropertyDecoder.svg?style=flat)](https://cocoapods.org/pods/PropertyDecoder)

## Usage

1. 首先导入模块
``` Swift
import PropertyDecoder
```

2. 新建模型，并遵守 `Decodable` 协议
``` Swift
struct Test: Decodable {
    let a: String
    let b: Int
    let c: Int?
    let d: String?
    let f: Data
    let arr: [String]
    let dict: [String: SubTest]
    let test: SubTest
}

struct SubTest: Decodable {
    let sub: String?
}
```
3. 使用
``` Swift
do {
    let list = try Property.decode(Test.self)
    _ = list.map{ print($0) }
  }catch {
    print(error)
  }
```
输出
```
{label: a, type: String}
{label: b, type: Int}
{label: c, type: Optional<Int>}
{label: d, type: Optional<String>}
{label: f, type: Data}
{label: arr, type: Array<String>}
{label: dict, type: Dictionary<String, SubTest>}
{label: test, type: SubTest}
```

## Requirements

* iOS 10.0+
* Xcode 10.2+
* Swift 5+

## Installation

### Cocoapods

```ruby
pod 'PropertyDecoder'
```
### Swift Package Manager
``` Swift
dependencies: [
    .package(url: "https://github.com/podul/PropertyDecoder", from: "0.1.1")
]
```
## Author

Podul, ylpodul@gmail.com

## License

PropertyDecoder is available under the MIT license. See the LICENSE file for more info.
