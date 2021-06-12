# Github Profile (Otrium iOS Challenge)

* 100% written in Swift.
* Programatic UI.
* MVP architecture.
* iOS 11 upwards.

![alt text](https://github.com/Isuru-Nanayakkara/Github-Profile/blob/main/screenshots/light-1.png) ![alt text](https://github.com/Isuru-Nanayakkara/Github-Profile/blob/main/screenshots/light-2.png)

> Dark mode is only available on iOS 13 and upwards

![alt text](https://github.com/Isuru-Nanayakkara/Github-Profile/blob/main/screenshots/dark-1.png) ![alt text](https://github.com/Isuru-Nanayakkara/Github-Profile/blob/main/screenshots/dark-2.png)

</br>

#### ⚠️ IMPORTANT

* Go to Github's **Settings** -> **Developer Settings** and select **Personal access tokens** and generate a token with the following scopes selected.
   - `public_repo`
   - `user`

![alt text](https://github.com/Isuru-Nanayakkara/Github-Profile/blob/main/screenshots/scope-1.png) ![alt text](https://github.com/Isuru-Nanayakkara/Github-Profile/blob/main/screenshots/scope-2.png)

* Copy the token and paste it as the value for the `token` constant in the _GraphQLClient.swift_ file inside the GraphQL directory.

```swift
final class GraphQLClient {
    static let shared = GraphQLClient()
    
    private let store: ApolloStore!
    private let cache: SQLiteNormalizedCache!
    private let configuration = URLSessionConfiguration.default
    private let token = "<GITHUB TOKEN>"
    
    // ...
```