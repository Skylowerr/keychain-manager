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
                UserDefaults.standard.set(email, forKey: "ud_email") //telefondaki .plist dosyasına yazar."ud_email" bu verinin etiketi, sonra bu etiketle okuyacaksın
                savedEmail = UserDefaults.standard.string(forKey:  "ud_email") ?? "" //az önce yazdığımızı geri okuyoruz ve savedEmail'e atıyoruz.
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
                KeychainManager.shared.save(password, forKey: "kc_password")
                savedPassword = KeychainManager.shared.get(forKey: "kc_password") ?? "nil döndü"
                password = ""
            }

            if !savedPassword.isEmpty {
                Text(savedPassword)
            }
        }
        .padding()
        ///Kullanıcı uygulamayı kapatıp açtığında daha önce kaydettiği veriler kaybolmasın diye var. Olmasaydı her uygulama açılışında ekran boş başlardı — veriler aslında kayıtlı olmasına rağmen.
        .onAppear {
            savedEmail    = UserDefaults.standard.string(forKey: "ud_email") ?? ""
            savedPassword = KeychainManager.shared.get(forKey: "kc_password") ?? ""
        }
    }
}

#Preview{
    ContentView()
}
