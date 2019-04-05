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
    
    public enum Group {
        case system
        case network
        case api
        case bluetooth
        case coordinator
        case custom(_ value: String)
        
        var identifier: String {
            switch self {
            case .system:
                return "System"
            case .network:
                return "Network"
            case .api:
                return "API"
            case .bluetooth:
                return "Bluetooth"
            case .coordinator:
                return "Coordinator"
            case .custom(let string):
                return string
            }
        }
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
    
    public func setSettings(to settings: Settings) {
        _settings = settings
    }
    
    // MARK: - Init
    
    private init() {}
    
    // MARK: - Direct Functions
    
    public func debug(_ string: String, group: Group? = nil) {
        groupedPrint(content: string, logLevel: .debug, group: group)
    }
    
    public func info(_ string: String, group: Group? = nil) {
        groupedPrint(content: string, logLevel: .info, group: group)
    }
    
    public func notice(_ string: String, group: Group? = nil) {
        groupedPrint(content: string, logLevel: .notice, group: group)
    }
    
    public func warning(_ string: String, group: Group? = nil) {
        groupedPrint(content: string, logLevel: .warning, group: group)
    }
    
    public func error(_ string: String, group: Group? = nil) {
        groupedPrint(content: string, logLevel: .error, group: group)
    }
    
    public func critical(_ string: String, group: Group? = nil) {
        groupedPrint(content: string, logLevel: .critical, group: group)
    }
    
    public func alert(_ string: String, group: Group? = nil) {
        groupedPrint(content: string, logLevel: .alert, group: group)
    }
    
    public func emergency(_ string: String, group: Group? = nil) {
        groupedPrint(content: string, logLevel: .emergency, group: group)
    }
    
    public func success(_ string: String, group: Group? = nil) {
        groupedPrint(content: string, logLevel: .success, group: group)
    }
    
    // MARK: - Print Functions
    
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
            printStatement += "[\(group.identifier)]"
        }
        
        printStatement += " \(content)"
        
        Swift.print(printStatement)
    }
    
}
