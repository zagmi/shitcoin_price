// ignore_for_file: constant_identifier_names, prefer_interpolation_to_compose_strings, avoid_print, void_checks, non_constant_identifier_names

library shitcoin_price;

import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

Future<String> ShitCoinPrice({
    String rpc = 'https://bsc-dataseed1.binance.org/',
    String router = '0x10ed43c718714eb63d5aa57b78b54704e256024e',
    String token = '0xC1DA031D459c574163e69E4370B465FaF3F5a7CF'
    }) async {
  final Token = token;
  final abi = await rootBundle.loadString('assets/router.json');

  final httpClient = Client();
  final ethClient = Web3Client(rpc, httpClient);
  final contract = DeployedContract(
      ContractAbi.fromJson(abi, 'Router'), EthereumAddress.fromHex(router));
  final result = await ethClient.call(
      contract: contract,
      function: contract.function('getAmountsOut'),
      params: [
        (BigInt.from(10) ^ BigInt.from(18)),
        [
          EthereumAddress.fromHex(Token),
          EthereumAddress.fromHex('0xe9e7cea3dedca5984780bafc599bd69add087d56')
        ]
      ]);
  final String price = result[1] / (BigInt.from(10) ^ BigInt.from(18));
  return price;
}
