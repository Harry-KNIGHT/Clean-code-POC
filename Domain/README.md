# Domain

## Entities

### Seller

The `Seller` struct represents a seller entity with essential information such as name, description, and geographic coordinates for the business layer.

#### Properties

- `id: String`: A unique identifier for the seller, based on their name.
- `name: String`: The name of the seller.
- `description: String`: A description of the seller.
- `coordinate: CLLocationCoordinate2D`: The geographic coordinates (latitude and longitude) of the seller's location.


## Repositories

### `SellerRepository` Protocol

The `SellerRepository` protocol defines the contract for fetching seller data. Implementing types conforming to this protocol are responsible for retrieving an array of `Seller` objects.

#### Method

##### `getSellers() async throws -> [Seller]`

- **Description**: Fetches an array of `Seller` objects asynchronously.
- **Returns**: An array of `Seller` objects on successful data retrieval.

### `SellerRepositoryDefault` Implementation

The `SellerRepositoryDefault` class is an implementation of the `SellerRepository` protocol and is responsible for fetching sellers' data using the `SellerServiceDefault` instance.

#### Properties

- `service: SellerServiceDefault`: An instance of the `SellerServiceDefault` class used for fetching seller data.

#### Initializer

##### `init(service: SellerServiceDefault)`

- **Description**: Initializes a new instance of `SellerRepositoryDefault` with the specified `SellerServiceDefault` instance.

#### Methods

##### `getSellers() async throws -> [Seller]`

- **Description**: Implements the `getSellers` method defined in the `SellerRepository` protocol. It retrieves seller data using the `service` property and maps the fetched `SellerData` to an array of `Seller` entities using the `SellerMapper` extension.
- **Throws**: A `SellerRepositoryError.cantGetSellers` error if an error occurs during data retrieval.
- **Returns**: An array of `Seller` objects on successful data retrieval.

#### Errors

- `SellerRepositoryError`: An enumeration of possible errors that can occur during the data retrieval process. It includes the `cantGetSellers` case, which indicates a failure to retrieve sellers' data.
