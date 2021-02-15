// Copyright © 2021 Metabolist. All rights reserved.

import UIKit
import ViewModels

final class EmojiCollectionViewCell: UICollectionViewCell {
    var emoji: PickerEmoji?

    override func updateConfiguration(using state: UICellConfigurationState) {
        guard let emoji = emoji else { return }

        contentConfiguration = EmojiContentConfiguration(emoji: emoji)

        var backgroundConfiguration = UIBackgroundConfiguration.listPlainCell()

        backgroundConfiguration.backgroundColor = state.isHighlighted || state.isSelected ? nil : .clear
        backgroundConfiguration.cornerRadius = .defaultCornerRadius

        self.backgroundConfiguration = backgroundConfiguration
    }
}
