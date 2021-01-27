// Copyright © 2020 Metabolist. All rights reserved.

import Kingfisher
import SwiftUI
import ViewModels

struct AddIdentityView: UIViewControllerRepresentable {
    let viewModelClosure: () -> AddIdentityViewModel
    let displayWelcome: Bool

    func makeUIViewController(context: Context) -> AddIdentityViewController {
        AddIdentityViewController(viewModel: viewModelClosure(), displayWelcome: displayWelcome)
    }

    func updateUIViewController(_ uiViewController: AddIdentityViewController, context: Context) {

    }
}

extension AddIdentityError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unableToConnectToInstance:
            return NSLocalizedString("add-identity.unable-to-connect-to-instance", comment: "")
        case .instanceNotSupported:
            return NSLocalizedString("add-identity.instance-not-supported", comment: "")
        }

    }
}

#if DEBUG
import PreviewViewModels

struct AddAccountView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddIdentityView(viewModelClosure: { RootViewModel.preview.addIdentityViewModel() }, displayWelcome: false)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#endif
