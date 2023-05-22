// ignore_for_file: constant_identifier_names, prefer_interpolation_to_compose_strings, avoid_print, void_checks, non_constant_identifier_names

library shitcoin_price;

import 'package:web3dart/web3dart.dart';
import '../abi/router.dart';

class ShitCoinPrice {
  Future<double> asDouble(
      Web3Client rpc, String router, String token0, String token1) async {
    try {
      final client = rpc;
      final contract = DeployedContract(
          ContractAbi.fromJson(abi, 'Router'), EthereumAddress.fromHex(router));
      final result = await client.call(
          contract: contract,
          function: contract.function('getAmountsOut'),
          params: [
            (BigInt.from(10).pow(18)),
            [EthereumAddress.fromHex(token0), EthereumAddress.fromHex(token1)]
          ]);
      if (result.isNotEmpty && result[0].length > 1) {
        final res = (result[0][1] as BigInt).toString();
        final value = BigInt.parse(res);
        final etherValue = EtherAmount.fromBigInt(EtherUnit.wei, value);
        final etherValueDouble = etherValue.getValueInUnit(EtherUnit.ether);
        print('The price in double is: $etherValueDouble');
        return etherValueDouble;
      } else {
        return 0.0;
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<BigInt> asBigInt(
      Web3Client rpc, String router, String token0, String token1) async {
    try {
      final client = rpc;
      final contract = DeployedContract(
          ContractAbi.fromJson(abi, 'Router'), EthereumAddress.fromHex(router));
      final result = await client.call(
          contract: contract,
          function: contract.function('getAmountsOut'),
          params: [
            (BigInt.from(10).pow(18)),
            [EthereumAddress.fromHex(token0), EthereumAddress.fromHex(token1)]
          ]);
      if (result.isNotEmpty && result[0].length > 1) {
        final etherValueBigInt = result[0][1];
        print('The price in bigint is: $etherValueBigInt');
        return etherValueBigInt;
      } else {
        return BigInt.zero;
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}

