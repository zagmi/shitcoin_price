// ignore_for_file: constant_identifier_names, prefer_interpolation_to_compose_strings, avoid_print, void_checks, non_constant_identifier_names

library shitcoin_price;

import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import '../abi/router.dart';

class ShitCoinPrice {
  Future<double> asDouble(
      {String rpc = 'https://bsc-dataseed1.binance.org/',
      String router = '0x10ed43c718714eb63d5aa57b78b54704e256024e',
      String token = '0x0e09fabb73bd3ade0a17ecc321fd13a19e81ce82'}) async {
    final Token = token;
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
            EthereumAddress.fromHex(
                '0xe9e7cea3dedca5984780bafc599bd69add087d56')
          ]
        ]);
    if (result.isNotEmpty && result[0].length > 1) {
      final res = (result[0][1] as BigInt).toString();
      final value = BigInt.parse(res);
      final etherValue = EtherAmount.fromBigInt(EtherUnit.wei, value);
      final etherValueDouble = etherValue.getValueInUnit(EtherUnit.ether);
      print('The price in double is: $etherValueDouble');
      return etherValueDouble;
    } else {
      throw Exception('Error: insufficient data to calculate the price');
    }
  }

  Future<BigInt> asBigInt(
      {String rpc = 'https://bsc-dataseed1.binance.org/',
      String router = '0x10ed43c718714eb63d5aa57b78b54704e256024e',
      String token = '0x0e09fabb73bd3ade0a17ecc321fd13a19e81ce82'}) async {
    final Token = token;
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
            EthereumAddress.fromHex(
                '0xe9e7cea3dedca5984780bafc599bd69add087d56')
          ]
        ]);
    if (result.isNotEmpty && result[0].length > 1) {
      final etherValueBigInt = result[0][1];
      print('The price in bigint is: $etherValueBigInt');
      return etherValueBigInt;
    } else {
      throw Exception('Error: insufficient data to calculate the price');
    }
  }
}
