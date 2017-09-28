# Ject

[![Version](https://img.shields.io/cocoapods/v/Ject.svg?style=flat)](http://cocoapods.org/pods/Ject)
[![License](https://img.shields.io/cocoapods/l/Ject.svg?style=flat)](http://cocoapods.org/pods/Ject)
[![Platform](https://img.shields.io/cocoapods/p/Ject.svg?style=flat)](http://cocoapods.org/pods/Ject)
[![Swift](https://camo.githubusercontent.com/554ea67e349e9c175f5bc52cf64519bc7471b986/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f53776966742d332d4631364433392e7376673f7374796c653d666c6174)](http://cocoapods.org/pods/Ject)

Ject is a simple, lightweight, quick solution for [dependency injection](https://en.wikipedia.org/wiki/Dependency_injection) for Swift.

It is designed with quick integration and set up in mind for the creative developer, ideal for small to medium sized projects. Ject takes inspiration from [Dagger2](https://google.github.io/dagger/), intended to provide simplicity over all for adding Dependency Injection to your project.

Ject is currently in Beta. 


Getting Started
-----------------------

#### Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate Ject into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'Ject'
```

Then, run the following command:

```bash
$ pod install
```

#### Making a class Injectable

In order to use Ject Dependency Injection, your dependencies must inherit from `Injectable`. Declare your class and have it implement `Injectable` from the `Ject` pod like so

```swift
class ViewUtils: Injectable {

    required init() {
        //Default Constructor
    }

    func inject(graph: Graph) -> Injectable {
        return ViewUtils()
    }

    func isSingleton() -> Bool {
        return true
    }

}
```

#### Injecting Dependencies into Dependencies

Many times your dependencies has dependencies of their own. Using Ject, you can simple inject these dependencies using two methods:




## Requirements
- [x] Swift 3
- [x] iOS 8.0+



## License

MIT license. See the [LICENSE file](LICENSE.txt) for details.
