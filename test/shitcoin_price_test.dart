// ignore_for_file: avoid_print, prefer_const_declarations

import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

Future<double> asDouble() async {
  final rpcUrl = 'https://bsc-dataseed1.binance.org/';
  final routerAddress = '0x10ed43c718714eb63d5aa57b78b54704e256024e';
  final tokenAddress = '0x0e09fabb73bd3ade0a17ecc321fd13a19e81ce82';

  print('Connecting to the network...');
  final httpClient = Client();
  final ethClient = Web3Client(rpcUrl, httpClient);
  print('Connection successful.');

  print('Getting data from the smart contract...');
  final abi =
      '[{"constant":true,"inputs":[{"name":"amountIn","type":"uint256"},'
      '{"name":"path","type":"address[]"}],"name":"getAmountsOut","outputs":[{"name":"'
      'amounts","type":"uint256[]"}],"payable":false,"stateMutability":"view","type":"function"}]';
  final contract = DeployedContract(ContractAbi.fromJson(abi, 'Router'),
      EthereumAddress.fromHex(routerAddress));
  final result = await ethClient.call(
      contract: contract,
      function: contract.function('getAmountsOut'),
      params: [
        BigInt.one * BigInt.from(10).pow(18),
        [
          EthereumAddress.fromHex(tokenAddress),
          EthereumAddress.fromHex('0xe9e7cea3dedca5984780bafc599bd69add087d56')
        ]
      ]);
  print('Data obtained successfully.');

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

Future<BigInt> asBigInt() async {
  final rpcUrl = 'https://bsc-dataseed1.binance.org/';
  final routerAddress = '0x10ed43c718714eb63d5aa57b78b54704e256024e';
  final tokenAddress = '0x0e09fabb73bd3ade0a17ecc321fd13a19e81ce82';

  print('Connecting to the network...');
  final httpClient = Client();
  final ethClient = Web3Client(rpcUrl, httpClient);
  print('Connection successful.');

  print('Getting data from the smart contract...');
  final abi =
      '[{"constant":true,"inputs":[{"name":"amountIn","type":"uint256"},'
      '{"name":"path","type":"address[]"}],"name":"getAmountsOut","outputs":[{"name":"'
      'amounts","type":"uint256[]"}],"payable":false,"stateMutability":"view","type":"function"}]';
  final contract = DeployedContract(ContractAbi.fromJson(abi, 'Router'),
      EthereumAddress.fromHex(routerAddress));
  final result = await ethClient.call(
      contract: contract,
      function: contract.function('getAmountsOut'),
      params: [
        BigInt.one * BigInt.from(10).pow(18),
        [
          EthereumAddress.fromHex(tokenAddress),
          EthereumAddress.fromHex('0xe9e7cea3dedca5984780bafc599bd69add087d56')
        ]
      ]);
  print('Data obtained successfully.');

  if (result.isNotEmpty && result[0].length > 1) {
    final etherValueBigInt = result[0][1];
    print('The price in bigint is: $etherValueBigInt');
    return etherValueBigInt;
  } else {
    throw Exception('Error: insufficient data to calculate the price');
  }
}

Future<void> main() async {
  await asDouble();
  await asBigInt();
}
