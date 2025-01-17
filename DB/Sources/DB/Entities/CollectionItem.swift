// Copyright © 2020 Metabolist. All rights reserved.

import Foundation
import Mastodon

public enum CollectionItem: Hashable {
    case status(Status, StatusConfiguration, Relationship?)
    case loadMore(LoadMore)
    case account(Account, AccountConfiguration, Relationship?, [Account], Suggestion.Source?)
    case notification(MastodonNotification, [Rule], StatusConfiguration?)
    case multiNotification([MastodonNotification], MastodonNotification.NotificationType, Date, Status?)
    case conversation(Conversation)
    case tag(Tag)
    case link(Card)
    case announcement(Announcement)
    case moreResults(MoreResults)
}

public extension CollectionItem {
    typealias Id = String

    struct StatusConfiguration: Hashable {
        public let showContentToggled: Bool
        public let showAttachmentsToggled: Bool
        public let isContextParent: Bool
        public let isPinned: Bool
        public let isReplyInContext: Bool
        public let isReplyOutOfContext: Bool
        public let hasReplyFollowing: Bool

        init(showContentToggled: Bool,
             showAttachmentsToggled: Bool,
             isContextParent: Bool = false,
             isPinned: Bool = false,
             isReplyInContext: Bool = false,
             isReplyOutOfContext: Bool = false,
             hasReplyFollowing: Bool = false) {
            self.showContentToggled = showContentToggled
            self.showAttachmentsToggled = showAttachmentsToggled
            self.isContextParent = isContextParent
            self.isPinned = isPinned
            self.isReplyInContext = isReplyInContext
            self.isReplyOutOfContext = isReplyOutOfContext
            self.hasReplyFollowing = hasReplyFollowing
        }
    }

    enum AccountConfiguration: Hashable {
        case withNote
        case withoutNote
        case followRequest
        case followSuggestion
        case mute
        case block
    }

    var itemId: Id? {
        switch  self {
        case let .status(status, _, _):
            return status.id
        case .loadMore:
            return nil
        case let .account(account, _, _, _, _):
            return account.id
        case let .notification(notification, _, _):
            return notification.id
        case .multiNotification:
            return nil
        case let .conversation(conversation):
            return conversation.id
        case let .tag(tag):
            return tag.name
        case let .link(card):
            return card.url.raw
        case let .announcement(announcement):
            return announcement.id
        case .moreResults:
            return nil
        }
    }
}

public extension CollectionItem.StatusConfiguration {
    static let `default` = Self(showContentToggled: false, showAttachmentsToggled: false)

    func reply() -> Self {
        Self(showContentToggled: showContentToggled,
             showAttachmentsToggled: showAttachmentsToggled,
             isContextParent: false,
             isPinned: false,
             isReplyInContext: false,
             hasReplyFollowing: true)
    }
}
