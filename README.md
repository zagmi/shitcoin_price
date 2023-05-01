## Package Info
This package uses the pool contract of each router and different cryptocurrency exchange platforms to take the price of any token even if it is not verified, it is free and without any kind of api key or registration required. 😎

<div style="display: flex; justify-content: center;">
  <img src="https://img.shields.io/pub/v/shitcoin_price?color=green">
  <img src="https://img.shields.io/pub/points/shitcoin_price">
  <img src="https://img.shields.io/pub/popularity/shitcoin_price?color=green">
  <img src="https://img.shields.io/badge/maintenance%20status-actively%20developed-brightgreen">
  <img src="https://img.shields.io/badge/coverage-100%25-orange">
</div>

## Features

Get the price in BUSD of any token on the Ethereum network and its subnets such as Binance Smart Chain, Polygon and others more.

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
final priceDouble = await ShitCoinPrice().asDouble(rpc: string, router: string, token: string);
print(priceDouble); // 2.688667399210412 CAKE
```

Or

```dart
final priceBigInt = await ShitCoinPrice().asBigInt(rpc: string, router: string, token: string);
print(priceBigInt); // 2688667399210411713 CAKE
```

In this example we import the package function and use it to get the price of a token, in this case CAKE and it returns a double or bigint number depending on how you handle the logic of the function.

- rpc: The rpc url on the network that we want to query.
- router: The address of the router, Uniswap, Pancakeswap, SushiSwap, or other.
- token: The address of the contract of the token that we want to consult the price.

NOTE: Check the test folder for an example implementation.
## Additional information

- [Check for rpc url here 🚨](https://rpc.info)

This package will be updated and added more features and utilities related to free price queries and market capitalization data, feel free to contribute!

Greetings. ⚡
