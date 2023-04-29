This package uses the pool contract of each router and different cryptocurrency exchange platforms to take the price of any token even if it is not verified, it is free and without any kind of apikeys or registration required. 😎

## Features

Get the price in USD of any token on the Ethereum network and its subnets such as Binance Smart Chain, Polygon and others more.

## Getting started

Add the package to your pubspec.yaml file as shown below.
```dart

dependencies:

  shitcoin_price: any

```

Then import the package into your code like this.
```dart

import 'package:shitcoin_price/shitcoin_price.dart';

```
## Usage

You can call the function and give it the parameters it wants to query, for example:


```dart
final price = await ShitCoinPrice(rpc: key, router: key, token: key);
```

AIn this example we import the package function to get the price and we give it the values to perform the query.

- rpc: The rpc url on the network that we want to query.
- router: The address of the router, Uniswap, Pancakeswap, SushiSwap, or other.
- token: The address of the contract of the token that we want to consult the price.

## Additional information

Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
