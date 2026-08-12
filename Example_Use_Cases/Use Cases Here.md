<!-- Make this better




Use Cases
User Roles
[UR] → Unregistered User
[R] → Registered User
[GD] → Game Dev
Use Case 1 - [UR] [R] [GD] Search Query(filters, titles, genre, tags) 
Use Case 2 - [UR] [R] [GD] Loading Game Details for Game Page (title, genre, tags, reviews, price)
Use Case 3 - [R] Friends List
Use Case 4 - [R] Buying a Game
Use Case 5 - [R] Access Inventory (collectibles)
Use Case 6 - [R] Achievements List
Use Case 7 - [R] Accessing Personal Game Library(downloading/updating/playing games)
Use Case 8 - [UR] [R] [GD] Browse Storefront (Featured Page)
Use Case 9 - [UR] [R] [GD] Developer/Publisher Page Info
Use Case 10 - [R] Leave Reviews
Use Case 11 - [GD] Publishing
Use Case 12 - [R] [GD] Logging in
Use Case 13 - [R] Wishlisting -->


## Use Cases
**User Roles**
- `[UR]` for Unregistered Users
- `[R]` for Registered Users
- `[GD]` for Game Developers

**Use Cases w/ User Roles Permissions**
* Use Case 1 - Search Query(filters, titles, genre, tags) 
⋅⋅⋅⋅* Enabled for: `[UR]` `[R]` `[GD]` 
- Use Case 2 - Loading Game Details for Game Page (title, genre, tags, reviews, price)
⋅⋅⋅⋅* Enabled for: `[UR]` `[R]` `[GD]` 
- Use Case 3 - Friends List
⋅⋅⋅⋅* Enabled for: `[R]`
- Use Case 4 - Buying a Game
⋅⋅⋅⋅* Enabled for: `[R]`
- Use Case 5 - Access Inventory (collectibles)
⋅⋅⋅⋅* Enabled for: `[R]`
- Use Case 6 - Achievements List
⋅⋅⋅⋅* Enabled for: `[R]`
- Use Case 7 - Accessing Personal Game Library(downloading/updating/playing games)
⋅⋅⋅⋅* Enabled for: `[R]`
- Use Case 8 - Browse Storefront (Featured Page)
⋅⋅⋅⋅* Enabled for: `[UR]` `[R]` `[GD]` 
- Use Case 9 - Developer/Publisher Page Info
⋅⋅⋅⋅* Enabled for: `[UR]` `[R]` `[GD]` 
- Use Case 10 - Leave Reviews
⋅⋅⋅⋅* Enabled for: `[R]`
- Use Case 11 - Publishing
⋅⋅⋅⋅* Enabled for: `[GD]`
- Use Case 12 - Logging in
⋅⋅⋅⋅* Enabled for: `[R]` `[GD]`
- Use Case 13 - Wishlisting
⋅⋅⋅⋅* Enabled for: `[R]`