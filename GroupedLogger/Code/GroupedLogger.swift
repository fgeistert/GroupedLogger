//
//  GroupedLogger.swift
//  GroupedLogger
//
//  Created by Fabian Geistert on 3/29/19.
//  Copyright © 2019 PocketSchool. All rights reserved.
//

import Foundation

public class GroupedLogger {
    
    // MARK: - Shared Instance
    
    public static let shared = GroupedLogger()
    
    // MARK: - Enums
    
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
    
    // MARK: - Groups
    
    public struct Group {
        let name: String
        
        public init(_ name: String) {
            self.name = name
        }
        
        public static let system: Group = Group("System")
        public static let network: Group = Group("Network")
        public static let api: Group = Group("API")
        public static let bluetooth: Group = Group("Bluetooth")
        public static let coordinator: Group = Group("Coordinator")
    }
    
    // MARK: - Settings
    
    public struct Settings {
        public enum UseTimestamp {
            case no
            case yes(dateFormatter: DateFormatter)
        }
        
        public enum UseEmoji {
            case no
            case yes
        }
        
        public let useTimestamp: UseTimestamp
        public let useEmoji: UseEmoji
        
        public init(useTimestamp: UseTimestamp, useEmoji: UseEmoji = .yes) {
            self.useTimestamp = useTimestamp
            self.useEmoji = useEmoji
        }
    }
    
    private lazy var _settings: Settings = {
        return Settings(useTimestamp: .no, useEmoji: .yes)
    }()
    
    /// set your new `Settings` to the shared GroupedLogger instance
    public func setSettings(to settings: Settings) {
        _settings = settings
    }
    
    // MARK: - Init
    
    private init() {}
    
    // MARK: - Direct Functions
    
    /// print a `String``to the console using the `.debug` `LogLevel` and an optional `Group`
    public func debug(_ string: String, group: Group? = nil) {
        groupedPrint(content: string, logLevel: .debug, group: group)
    }
    
    /// print a `String``to the console using the `.info` `LogLevel` and an optional `Group`
    public func info(_ string: String, group: Group? = nil) {
        groupedPrint(content: string, logLevel: .info, group: group)
    }
    
    /// print a `String``to the console using the `.notice` `LogLevel` and an optional `Group`
    public func notice(_ string: String, group: Group? = nil) {
        groupedPrint(content: string, logLevel: .notice, group: group)
    }
    
    /// print a `String``to the console using the `.warning` `LogLevel` and an optional `Group`
    public func warning(_ string: String, group: Group? = nil) {
        groupedPrint(content: string, logLevel: .warning, group: group)
    }
    
    /// print a `String``to the console using the `.error` `LogLevel` and an optional `Group`
    public func error(_ string: String, group: Group? = nil) {
        groupedPrint(content: string, logLevel: .error, group: group)
    }
    
    /// print a `String``to the console using the `.critical` `LogLevel` and an optional `Group`
    public func critical(_ string: String, group: Group? = nil) {
        groupedPrint(content: string, logLevel: .critical, group: group)
    }
    
    /// print a `String``to the console using the `.alert` `LogLevel` and an optional `Group`
    public func alert(_ string: String, group: Group? = nil) {
        groupedPrint(content: string, logLevel: .alert, group: group)
    }
    
    /// print a `String``to the console using the `.emergency` `LogLevel` and an optional `Group`
    public func emergency(_ string: String, group: Group? = nil) {
        groupedPrint(content: string, logLevel: .emergency, group: group)
    }
    
    /// print a `String``to the console using the `.success` `LogLevel` and an optional `Group`
    public func success(_ string: String, group: Group? = nil) {
        groupedPrint(content: string, logLevel: .success, group: group)
    }
    
    // MARK: - Print Functions
    
    /// print a `String` to the console with an optional `LogLevel` and a `Group`
    public func print(_ string: String, logLevel: LogLevel = .debug, group: Group? = nil) {
        groupedPrint(content: string, logLevel: logLevel, group: group)
    }
    
    // MARK: - Privates
    
    private func groupedPrint(content: String, logLevel: LogLevel, group: Group? = nil) {
        var printStatement: String = ""
        
        switch _settings.useEmoji {
        case .no:
            switch logLevel {
            case .debug:
                printStatement += "[Debug]"
            case .info:
                printStatement += "[Info]"
            case .notice:
                printStatement += "[Notice]"
            case .warning:
                printStatement += "[Warning]"
            case .error:
                printStatement += "[Error]"
            case .critical:
                printStatement += "[Critical]"
            case .alert:
                printStatement += "[Alert]"
            case .emergency:
                printStatement += "[Emergency]"
            case .success:
                printStatement += "[Success]"
            }
        case .yes:
            printStatement += "\(logLevel.rawValue)"
        }
        
        switch _settings.useTimestamp {
        case .no: break
        case .yes(let dateFormatter):
            printStatement += "[\(dateFormatter.string(from: Date()))]"
        }
        
        if let group = group {
            printStatement += "[\(group.name)]"
        }
        
        printStatement += " \(content)"
        
        Swift.print(printStatement)
    }
}
