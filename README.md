# SwiftLink

Bindings into [Ableton Link](https://github.com/Ableton/link) for Swift.

Note: is this library for you? Ableton already provides an [iOS SDK](https://github.com/Ableton/LinkKit) for link. 

However, if you require low level bindings into the C++ library, this is for you!

# Installation 

```
git submodule add git@github.com:wavejumper/SwiftLink.git SwiftLink
git submodule update --init --recursive
```

Inside your `Podfile`:

```ruby
  pod 'SwiftLink', :path => 'SwiftLink'
```

# Demo

Inside your bridging header add:

```
#import "SwiftLink.h"
```


```swift
let initialBpm: Double = 120
let link = AbletonLink(bpm: initialBpm)

let tempoObservation = link.observe(\.onTempo, options: .new) { l, change in
  print("tempo change!")
}
```
