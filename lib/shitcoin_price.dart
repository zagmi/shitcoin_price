// ignore_for_file: constant_identifier_names, prefer_interpolation_to_compose_strings, avoid_print, void_checks

library shitcoin_price;

import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

Future<String> main() async {
  const Token = '0x0e09fabb73bd3ade0a17ecc321fd13a19e81ce82';
  final abi = await rootBundle.loadString('assets/router.json');

  final httpClient = Client();
  final ethClient =
      Web3Client('https://bsc-dataseed1.binance.org:443', httpClient);
  final contract = DeployedContract(
      ContractAbi.fromJson(abi, '0x10ed43c718714eb63d5aa57b78b54704e256024e'),
      EthereumAddress.fromHex('0x10ed43c718714eb63d5aa57b78b54704e256024e'));
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
