// ignore_for_file: avoid_print, prefer_const_declarations

import 'package:http/http.dart';
import 'package:shitcoin_price/shitcoin_price.dart';
import 'package:web3dart/web3dart.dart';

Future<void> main() async {
  print('Connecting to the network...');
  String rpc = 'https://bsc-dataseed1.binance.org/';
  String router = '0x10ed43c718714eb63d5aa57b78b54704e256024e';
  String token0 = '0x0e09fabb73bd3ade0a17ecc321fd13a19e81ce82';
  String token1 = '0xe9e7cea3dedca5984780bafc599bd69add087d56';
  final httpClient = Client();
  final provider = Web3Client(rpc, httpClient);
  print('Connection successful.');
  print('Getting data from the smart contract...');
  final priceDouble = await ShitCoinPrice().asDouble(provider, router, token0, token1);
  final priceBigInt = await ShitCoinPrice().asBigInt(provider, router, token0, token1);
  print('Data obtained successfully.');
  print(priceDouble);
  print(priceBigInt);
}
