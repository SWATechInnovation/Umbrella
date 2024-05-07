//
//  MyAppEvent.swift
//  UmbrellaExample
//
//  Created by Jeffrey Berthiaume on 5/7/24.
//

import Foundation
import Umbrella

enum MyAppEvent {
    case viewItems
    case clickItem(itemName: String)
}

extension MyAppEvent: EventType {
  /// An event name to be logged
  func name(for provider: ProviderType) -> String? {
    switch self {
    case .viewItems: return "viewItems"
    case .clickItem: return "clickItem"
    }
  }

  /// Parameters to be logged
  func parameters(for provider: ProviderType) -> [String: Any]? {
    switch self {
    case let .viewItems:
      return []
    case let .clickItem(itemName):
      return ["itemName": itemName]
    }
  }
}
