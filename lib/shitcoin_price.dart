library shitcoin_price;

import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

void main() async {
  final Token = '0x0e09fabb73bd3ade0a17ecc321fd13a19e81ce82';
  final abi = [
    {
      "inputs": [
        {"internalType": "uint256", "name": "amountIn", "type": "uint256"},
        {"internalType": "address[]", "name": "path", "type": "address[]"}
      ],
      "name": "getAmountsOut",
      "outputs": [
        {"internalType": "uint256[]", "name": "amounts", "type": "uint256[]"}
      ],
      "stateMutability": "view",
      "type": "function"
    }
  ];

  final httpClient = Client();
  final ethClient =
      Web3Client('https://bsc-dataseed1.binance.org:443', httpClient);
  final contract = DeployedContract(
      ContractAbi.fromJson(
          abi as String, '0x10ed43c718714eb63d5aa57b78b54704e256024e'),
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
  final price = result[1] / (BigInt.from(10) ^ BigInt.from(18));
  print('\$' + price.toStringAsFixed(2));
}
