import SwiftUI
import KeychainManager

struct ContentView: View {

    @State private var email: String = ""
    @State private var password: String = ""
    @State private var savedEmail: String = ""
    @State private var savedPassword: String = ""

    var body: some View {
        VStack(spacing: 24) {

            // MARK: - UserDefaults
            Text("UserDefaults")
                .font(.headline)

            TextField("Enter Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)

            Button("Save Email") {
                UserDefaults.standard.set(email, forKey: "ud_email")
                savedEmail = UserDefaults.standard.string(forKey: "ud_email") ?? ""
                email = ""
            }

            if !savedEmail.isEmpty {
                Text(savedEmail)
            }

            Divider()

            // MARK: - Keychain
            Text("KeyChain Wrapper")
                .font(.headline)

            TextField("Enter Password", text: $password)
                .textFieldStyle(.roundedBorder)

            Button("Save Password") {
                let success = KeychainManager.shared.save(password, forKey: "kc_password")
                print("Keychain kayıt: \(success)")  // false gelirse entitlement sorunu
                savedPassword = KeychainManager.shared.get(forKey: "kc_password") ?? "nil döndü"
                password = ""
            }

            if !savedPassword.isEmpty {
                Text(savedPassword)
            }
        }
        .padding()
        .onAppear {
            savedEmail    = UserDefaults.standard.string(forKey: "ud_email") ?? ""
            savedPassword = KeychainManager.shared.get(forKey: "kc_password") ?? ""
        }
    }
}

#Preview{
    ContentView()
}
