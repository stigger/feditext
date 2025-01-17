// Copyright © 2020 Metabolist. All rights reserved.

import Foundation
import ViewModels

extension ProfileCollection {
    func title(statusWord: AppPreferences.StatusWord, shorten: Bool) -> String {
        switch self {
        case .statuses:
            switch statusWord {
            case .toot:
                return NSLocalizedString("account.statuses.toot", comment: "")
            case .post:
                return NSLocalizedString("account.statuses.post", comment: "")
            }
        case .statusesAndReplies:
            switch (statusWord, shorten) {
            case (.toot, false):
                return NSLocalizedString("account.statuses-and-replies.toot", comment: "")
            case (.post, false):
                return NSLocalizedString("account.statuses-and-replies.post", comment: "")
            case (_, true):
                return NSLocalizedString("account.statuses-and-replies.short", comment: "")
            }
        case .statusesAndBoosts:
            switch (statusWord, shorten) {
            case (.toot, false):
                return NSLocalizedString("account.statuses-and-boosts.toot", comment: "")
            case (.post, false):
                return NSLocalizedString("account.statuses-and-boosts.post", comment: "")
            case (_, true):
                return NSLocalizedString("account.statuses-and-boosts.short", comment: "")
            }
        case .media:
            return NSLocalizedString("account.media", comment: "")
        }
    }
}
