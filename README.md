# GroupedLogger
[![Swift 4](https://img.shields.io/badge/Language-Swift%204-orange.svg)](https://developer.apple.com/swift)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

A simple, lightweight and easy-to-use logging library to spice up your logs and make finding things easier.

## Why do I need a logging library?
You are right by asking yourself this question. You do not *necessarily* need *another* library, just to make your logs prettier. The reason, however, why I made this library is to make your logs more searchable.

### Why I decided to make this framework
1. I always wanted to make my own framework, so this was a great opportunity.
2. At work I recently worked on a huge project, that involved *a lot* of network calls. Additionally it connected to a lot of devices via bluetooth. Everything was printed to the console, which made using it impossible. Whenever I wanted to `print` something I had to use a prefix.

And so I thought: why not give every log a `Group` and make logs more organized.  
**Bonus**: with `Group`s, `LogLevel`s and `Time` you can now easily search/filter your logs, to find everything related to it.

## Usage
The project includes an Example target.
### Getting started
Create a global instance of `GroupedLogger` like this:
```swift
import GroupedLogger

// setup logger
let log = GroupedLogger.shared
```
Now you are ready to setup your first log :tada:
```swift
log.debug("Hello, World!") // prints: 📢 Hello, World!
log.print("Hello, World!") // prints: 📢 Hello, World!
```

### Log Levels
GroupedLogger has 9 different log levels to make your logs more useful.
They are constructed like the following:
```swift
public enum LogLevel: String {
    case debug = "📢"
    case info = "ℹ️"
    case notice = "🔶"
    case warning = "⚠️"
    case error = "❌"
    case critical = "❗️"
    case alert = "🚨"
    case emergency = "🚒"
    case success = "✅"
}
```
You can access each log level either by using `log.[LogLevel](String)` or by using `log.print(String, logLevel: .[LogLevel])`.
You can find more examples at the end of this section.

### Groups
My favorite feature of this framework is the ability to add groups to your logs. Groups make it easier to find everything related to a topic. If you have a networking library for example and you want to log all events, the console can get clustered really fast. Good luck finding anything. Giving all your networking prints a `Group` however, will make it easy to search for everything related to it.  

For now `GroupedLogger` comes with 5 predefined groups. Feel free to suggest more.
```swift
public struct Group {
    public static let system: Group = Group("System")
    public static let network: Group = Group("Network")
    public static let api: Group = Group("API")
    public static let bluetooth: Group = Group("Bluetooth")
    public static let coordinator: Group = Group("Coordinator")
}
```
You can also add your custom `Group` by extending `GroupedLogger.Group` like this:
```swift
// custom logging groups
extension GroupedLogger.Group {
    static let sync = GroupedLogger.Group("Sync")
    static let moya = GroupedLogger.Group("Moya")
}
```
Now you can just call it like this:
```swift
log.debug("Test", group: .system) // prints: 📢[System] Test
log.print("Another Test", group: .network) // prints: 📢[Network] Another Test
```
Finding all `Network` related logs is now as easy as searching for `[Network]` in your console. Nice :tada:

**Note**: `Group`s are optional, but probably the best feature of `GroupedLogger` (hence the name :wink:)

### Settings
I have implemented settings to make your logger as customizable as possible. Simply call `log.setSettings()` to adjust them to your needs.  
`Settings` have two options:
- show timestamps (yes or no)
- show emojis (yes or no)
To disable Emojis and print the time, simply write:
```swift
// set settings
log.setSettings(to: GroupedLogger.Settings(useTimestamp: .yes(dateFormatter: standardDateFormatter), useEmoji: .no))
log.print("Test") // prints: [Debug][11:43:12] Test
```
As you can see above, if you turn on `useTimestamp` to `.yes`, you have to pass a `DateFormatter` with it.  
In the example above i used the following `DateFormatter`:
```swift
lazy var standardDateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss"
    return dateFormatter
}()
```
**Note**: if you don’t change the settings, they are set to `useTimestamp: .no` and `useEmojis: .yes`.  
**Another Note**: changing the settings with `log.setSettings(Settings)` will change the appearance for all future logs.

### More Examples
#### Standard use
```swift
log.debug("Test") // prints: 📢 Test
log.info("Test") // prints: ℹ️ Test
log.notice("Test") // prints: 🔶 Test
log.warning("Test") // prints: ⚠️ Test
log.error("Test") // prints: ❌ Test
log.critical("Test") // prints: ❗️ Test
log.alert("Test") // prints: 🚨 Test
log.emergency("Test") // prints: 🚒 Test
log.success("Test") // prints: ✅ Test
```
#### Equivalent
```swift
log.print("Test", logLevel: .debug) // prints: 📢 Test
log.print("Test", logLevel: .info) // prints: ℹ️ Test
log.print("Test", logLevel: .notice) // prints: 🔶 Test
log.print("Test", logLevel: .warning) // prints: ⚠️ Test
log.print("Test", logLevel: .error) // prints: ❌ Test
log.print("Test", logLevel: .critical) // prints: ❗️ Test
log.print("Test", logLevel: .alert) // prints: 🚨 Test
log.print("Test", logLevel: .emergency) // prints: 🚒 Test
log.print("Test", logLevel: .success) // prints: ✅ Test
```

## Installing
### Swift Package Manager (Recommended)


### Cartage
Add the following line to your [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile).

```
github "fgeistert/GroupedLogger" ~> 2.0
```

Then run `carthage update`.
### Manually
Just drag and drop the `.swift` files from the `GroupedLogger` folder into your project.

## Version Compatibility
GroupedLogger is built with Swift 5

## Contributing
- Open an issue
- Fork it
- create new branch
- commit all your changes to your branch
- create a pull request

## Contact
You can [check out my website](https://fgeistert.com/) or [follow me on twitter](https://twitter.com/fgeistert).
