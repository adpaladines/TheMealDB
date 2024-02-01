[![License][license-image]][license-url] [![Swift Version][swift-image]][swift-url]  [![SwiftUI][swiftUI-image]][swiftUI-url]

[swift-image]:https://img.shields.io/badge/Swift-5.9.2-orange?style=for-the-badge
[swift-url]: https://swift.org/

[license-image]: https://img.shields.io/badge/License-MIT-blue?style=for-the-badge
[license-url]: LICENSE

[SwiftUI-image]: https://img.shields.io/badge/SwiftUI-3.0-orange?style=for-the-badge&logo=swift&logoColor=white
[SwiftUI-url]: https://developer.apple.com/xcode/swiftui/

# TheMealDB
This is a project made in swift for iOS 15+

## Project Description:
In this app you will be able to look for meals from an API on [themealdb.com](https://www.themealdb.com/api.php).

This application was inspired on [Behance.net recipe-app-ui](https://www.behance.net/gallery/176410731/recipe-app-ui?tracking_source=search_projects|recipe+app+design) UX design.

## Table of Contents:
In the structure files contains: 
- Model
- View
- ViewModel
- Network
- Coordinator
- Unit Tests
- JailBreak Check

## Installation
Can be used with Xcode 15.1 and above. Compatible with iPhone and iPad with minimum iOS version 15.0.

## Frameworks used:
- Combine.
- SwiftUI.
- [KingFisher](https://github.com/onevcat/Kingfisher).

## Architecture:
- Architecture: MVVM-C -> Model View ViewModel Coordinator (Coordinator Pattern).

## Design Patterns
- Observer
- Singleton
- Builder
- Publisher-Subscriber

## Security (optional)
 1. Jailbroken Detection
 2. Development techniques or best practices

## Functionalities:
- Full list of recipes from Dessert category.
- Recipes Details with images and or YouTube videos.
- Youtube View made with WebKit and wrapped in UIViewRepresentable.

## Test Cases:
 - TDD: Units tests for success and failure situations. Faked responses using FakeNetworkManager using test jsons. Written test cases for view model testing.

## Captures:
|Description| Capture|
|---|---|
| Test cases OK | ![image](https://github.com/adpaladines/TheMealDB/Resources/) |
| Work around only for M1 Macs | ![image](https://github.com/adpaladines/TheMealDB/Resources/) |
