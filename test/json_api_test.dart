import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_test/flutter_test.dart';
import 'package:japx/japx.dart';

import 'AssetsModel.dart';

void main() {
  Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
    print('--- Parse json from: $assetsPath');
    // final String jsonString = await rootBundle.loadString(assetsPath);
    return jsonDecode("""{
    "data": [
    {
    "id": "ACCTOKE",
    "type": "assets",
    "attributes": {
    "available_for_issuance": "39399.000000",
    "details": {
    "name": "ACCION BLOCK",
    "external_system_type": "",
    "is_coinpayments": false,
    "logo": {
    "key": "dpurgh4ing3gnlbw46rplvwpxjtmfj6xvhyaco2sy5j2gauakydfjz2ssb7z6lz3z4auebudi4tfhnoutdt7kkuz",
    "type": "image/png"
    },
    "terms": {
    "key": "",
    "type": "",
    "name": ""
    },
    "stellar": {

    },
    "erc20": {

    }
    },
    "issued": "10601.000000",
    "max_issuance_amount": "100000.000000",
    "pending_issuance": "0.000000",
    "policies": {
    "value": 105,
    "flags": [
    {
    "name": "transferable",
    "value": 1
    },
    {
    "name": "withdrawable",
    "value": 8
    },
    {
    "name": "can_be_base_in_atomic_swap",
    "value": 32
    },
    {
    "name": "can_be_quote_in_atomic_swap",
    "value": 64
    }
    ]
    },
    "pre_issuance_asset_signer": "GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5",
    "state": {
    "name": "active",
    "value": 0
    },
    "trailing_digits": 6,
    "type": 0
    },
    "relationships": {
    "owner": {
    "data": {
    "id": "GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5",
    "type": "accounts"
    }
    }
    }
    },
    {
    "id": "ACCTOKEN",
    "type": "assets",
    "attributes": {
    "available_for_issuance": "9223372033329.888444",
    "details": {
    "name": "ACCION",
    "logo": {
    "mime_type": "image/png",
    "name": "LOGO ACCION LABORAL.png",
    "key": "dpurex4ineiw7yrflxnizl6u43vkilecctysshm3xvjstra6bc5kagdvfsuttgezcoso6wll2gdhpugqnkfz6jdi",
    "type": ""
    },
    "terms": {
    "mime_type": "",
    "name": "",
    "key": "",
    "type": ""
    },
    "stellar": {

    }
    },
    "issued": "3524.887363",
    "max_issuance_amount": "9223372036854.775807",
    "pending_issuance": "0.000000",
    "policies": {
    "value": 9,
    "flags": [
    {
    "name": "transferable",
    "value": 1
    },
    {
    "name": "withdrawable",
    "value": 8
    }
    ]
    },
    "pre_issuance_asset_signer": "GAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHV4",
    "state": {
    "name": "active",
    "value": 0
    },
    "trailing_digits": 6,
    "type": 0
    },
    "relationships": {
    "owner": {
    "data": {
    "id": "GBFC6RWHFF6X46Q2Z57HCTVYZQCQ342T3DMRA5VY6STXYAKN54D5ERZM",
    "type": "accounts"
    }
    }
    }
    },
    {
    "id": "ACME",
    "type": "assets",
    "attributes": {
    "available_for_issuance": "9223271946842.775807",
    "details": {
    "name": "ACME Coin",
    "logo": {
    "mime_type": "image/png",
    "name": "ACME_logo.png",
    "key": "dpurex4ineiw7yrflxnizl6u43vkilecctysshm3xvjstra6bc5kagdvfsutttap6rsb26a227xvvfjw3tl4qsxr",
    "type": ""
    },
    "terms": {
    "mime_type": "application/pdf",
    "name": "ACME Coin Legal Terms.pdf",
    "key": "dpurex4ineiw7yrflxnizl6u43vkilecctysshm3xvjstra6bc5kagdvfsuttsemmu5kizgp5pfu6k7apdfhvdus",
    "type": ""
    },
    "stellar": {

    }
    },
    "issued": "100090012.000000",
    "max_issuance_amount": "9223372036854.775807",
    "pending_issuance": "0.000000",
    "policies": {
    "value": 9,
    "flags": [
    {
    "name": "transferable",
    "value": 1
    },
    {
    "name": "withdrawable",
    "value": 8
    }
    ]
    },
    "pre_issuance_asset_signer": "GAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHV4",
    "state": {
    "name": "active",
    "value": 0
    },
    "trailing_digits": 6,
    "type": 1
    },
    "relationships": {
    "owner": {
    "data": {
    "id": "GBFC6RWHFF6X46Q2Z57HCTVYZQCQ342T3DMRA5VY6STXYAKN54D5ERZM",
    "type": "accounts"
    }
    }
    }
    },
    {
    "id": "ARE",
    "type": "assets",
    "attributes": {
    "available_for_issuance": "100000.000000",
    "details": {
    "name": "ACME Real Estate",
    "logo": {
    "mime_type": "image/png",
    "name": "4 - Create token - Token logo - Gold.png",
    "key": "dpurex4ineiw7yrflxnizl6u43vkilecctysshm3xvjstra6bc5kagdvfsuttr2lkblgntpcblkhwyjdrqjvvjt4",
    "type": ""
    },
    "terms": {
    "mime_type": "",
    "name": "",
    "key": "",
    "type": ""
    },
    "stellar": {

    }
    },
    "issued": "0.000000",
    "max_issuance_amount": "100000.000000",
    "pending_issuance": "0.000000",
    "policies": {
    "value": 9,
    "flags": [
    {
    "name": "transferable",
    "value": 1
    },
    {
    "name": "withdrawable",
    "value": 8
    }
    ]
    },
    "pre_issuance_asset_signer": "GAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHV4",
    "state": {
    "name": "active",
    "value": 0
    },
    "trailing_digits": 6,
    "type": 0
    },
    "relationships": {
    "owner": {
    "data": {
    "id": "GBFC6RWHFF6X46Q2Z57HCTVYZQCQ342T3DMRA5VY6STXYAKN54D5ERZM",
    "type": "accounts"
    }
    }
    }
    },
    {
    "id": "ATB",
    "type": "assets",
    "attributes": {
    "available_for_issuance": "9222372036854.775807",
    "details": {
    "name": "ATB card",
    "logo": {
    "mime_type": "image/png",
    "name": "atb-market_f.png",
    "key": "dpurex4ine6ry6phtackzcqpet3ird7c4rzmccb5nl4t54t4477o7zslm43mw6rzgp24ztbknvbnhnh7ruxe7ctf"
    },
    "terms": {
    "mime_type": "image/jpeg",
    "name": "ForkLog.jpg",
    "key": "dpurex4ine6ry6phtackzcqpet3ird7c4rzmccb5nl4t54t4477o7zslm43mwvsvwthnh467tewxuryofp4tlsn6"
    },
    "stellar": {

    },
    "erc20": {

    }
    },
    "issued": "1000000000.000000",
    "max_issuance_amount": "9223372036854.775807",
    "pending_issuance": "0.000000",
    "policies": {
    "value": 41,
    "flags": [
    {
    "name": "transferable",
    "value": 1
    },
    {
    "name": "withdrawable",
    "value": 8
    },
    {
    "name": "can_be_base_in_atomic_swap",
    "value": 32
    }
    ]
    },
    "pre_issuance_asset_signer": "GBTFZXIF5SRV4X6BBVRF33OYHSDOLZXVB5ZQOQG2DPRTH73TUSMCBTCW",
    "state": {
    "name": "active",
    "value": 0
    },
    "trailing_digits": 6,
    "type": 0
    },
    "relationships": {
    "owner": {
    "data": {
    "id": "GBTFZXIF5SRV4X6BBVRF33OYHSDOLZXVB5ZQOQG2DPRTH73TUSMCBTCW",
    "type": "accounts"
    }
    }
    }
    },
    {
    "id": "BOOST",
    "type": "assets",
    "attributes": {
    "available_for_issuance": "100.000000",
    "details": {
    "name": "BOOST",
    "stellar": {

    },
    "erc20": {

    }
    },
    "issued": "0.000000",
    "max_issuance_amount": "200.000000",
    "pending_issuance": "0.000000",
    "policies": {
    "value": 1,
    "flags": [
    {
    "name": "transferable",
    "value": 1
    }
    ]
    },
    "pre_issuance_asset_signer": "GBFC6RWHFF6X46Q2Z57HCTVYZQCQ342T3DMRA5VY6STXYAKN54D5ERZM",
    "state": {
    "name": "active",
    "value": 0
    },
    "trailing_digits": 6,
    "type": 0
    },
    "relationships": {
    "owner": {
    "data": {
    "id": "GBFC6RWHFF6X46Q2Z57HCTVYZQCQ342T3DMRA5VY6STXYAKN54D5ERZM",
    "type": "accounts"
    }
    }
    }
    },
    {
    "id": "BTC",
    "type": "assets",
    "attributes": {
    "available_for_issuance": "18995269.400000",
    "details": {
    "name": "Bitcoin"
    },
    "issued": "2004730.600000",
    "max_issuance_amount": "21000000.000000",
    "pending_issuance": "0.000000",
    "policies": {
    "value": 3,
    "flags": [
    {
    "name": "transferable",
    "value": 1
    },
    {
    "name": "base_asset",
    "value": 2
    }
    ]
    },
    "pre_issuance_asset_signer": "GBA4EX43M25UPV4WIE6RRMQOFTWXZZRIPFAI5VPY6Z2ZVVXVWZ6NEOOB",
    "state": {
    "name": "active",
    "value": 0
    },
    "trailing_digits": 6,
    "type": 0
    },
    "relationships": {
    "owner": {
    "data": {
    "id": "GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5",
    "type": "accounts"
    }
    }
    }
    },
    {
    "id": "Bym",
    "type": "assets",
    "attributes": {
    "available_for_issuance": "0.000000",
    "details": {
    "name": "Byom",
    "external_system_type": "",
    "is_coinpayments": true,
    "logo": {
    "key": "dpurgh4inhqc7sosp4kflcozqj2xojxakeewt6t5slncfyeqg7betejfaxs4nyfczhzpnkarnop75o2rgnkvv3bq",
    "type": "image/jpeg"
    },
    "terms": {
    "key": "",
    "type": "",
    "name": ""
    },
    "stellar": {
    "withdraw": true,
    "deposit": true,
    "asset_type": "credit_alphanum12",
    "asset_code": "ByomT"
    },
    "erc20": {

    }
    },
    "issued": "0.000000",
    "max_issuance_amount": "1000.000000",
    "pending_issuance": "0.000000",
    "policies": {
    "value": 11,
    "flags": [
    {
    "name": "transferable",
    "value": 1
    },
    {
    "name": "base_asset",
    "value": 2
    },
    {
    "name": "withdrawable",
    "value": 8
    }
    ]
    },
    "pre_issuance_asset_signer": "GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5",
    "state": {
    "name": "active",
    "value": 0
    },
    "trailing_digits": 6,
    "type": 1
    },
    "relationships": {
    "owner": {
    "data": {
    "id": "GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5",
    "type": "accounts"
    }
    }
    }
    },
    {
    "id": "CARB",
    "type": "assets",
    "attributes": {
    "available_for_issuance": "0.000000",
    "details": {
    "name": "CARBON ASSET",
    "external_system_type": "",
    "is_coinpayments": false,
    "logo": {
    "key": "dpurgh4ing3gnlbw46rplvwpxjtmfj6xvhyaco2sy5j2gauakydfjz2ssb7z7xqjt7a3sjeiac42pgxlmwpld3dg",
    "type": "image/png"
    },
    "terms": {
    "key": "",
    "type": "",
    "name": ""
    },
    "stellar": {

    },
    "erc20": {

    }
    },
    "issued": "0.000000",
    "max_issuance_amount": "1000000.000000",
    "pending_issuance": "0.000000",
    "policies": {
    "value": 1,
    "flags": [
    {
    "name": "transferable",
    "value": 1
    }
    ]
    },
    "pre_issuance_asset_signer": "GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5",
    "state": {
    "name": "active",
    "value": 0
    },
    "trailing_digits": 6,
    "type": 0
    },
    "relationships": {
    "owner": {
    "data": {
    "id": "GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5",
    "type": "accounts"
    }
    }
    }
    },
    {
    "id": "CARBON",
    "type": "assets",
    "attributes": {
    "available_for_issuance": "9223372036854.775807",
    "details": {
    "name": "CARBON OFFSET 1",
    "logo": {
    "mime_type": "image/png",
    "name": "LATAM GREEN EXCHANGE NIÑO + x - png.png",
    "key": "dpurex4ineiw7yrflxnizl6u43vkilecctysshm3xvjstra6bc5kagdvfsuttjfwvsfiocxzgvd6rh5pljhga4by",
    "type": ""
    },
    "terms": {
    "mime_type": "",
    "name": "",
    "key": "",
    "type": ""
    },
    "stellar": {

    },
    "erc20": {

    }
    },
    "issued": "0.000000",
    "max_issuance_amount": "9223372036854.775807",
    "pending_issuance": "0.000000",
    "policies": {
    "value": 1,
    "flags": [
    {
    "name": "transferable",
    "value": 1
    }
    ]
    },
    "pre_issuance_asset_signer": "GAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHV4",
    "state": {
    "name": "active",
    "value": 0
    },
    "trailing_digits": 6,
    "type": 0
    },
    "relationships": {
    "owner": {
    "data": {
    "id": "GBFC6RWHFF6X46Q2Z57HCTVYZQCQ342T3DMRA5VY6STXYAKN54D5ERZM",
    "type": "accounts"
    }
    }
    }
    },
    {
    "id": "Chardonnay",
    "type": "assets",
    "attributes": {
    "available_for_issuance": "100000.000000",
    "details": {
    "name": "Vinos",
    "logo": {
    "mime_type": "",
    "name": "",
    "key": "",
    "type": ""
    },
    "terms": {
    "mime_type": "",
    "name": "",
    "key": "",
    "type": ""
    },
    "stellar": {

    }
    },
    "issued": "0.000000",
    "max_issuance_amount": "100000.000000",
    "pending_issuance": "0.000000",
    "policies": {
    "value": 9,
    "flags": [
    {
    "name": "transferable",
    "value": 1
    },
    {
    "name": "withdrawable",
    "value": 8
    }
    ]
    },
    "pre_issuance_asset_signer": "GAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHV4",
    "state": {
    "name": "active",
    "value": 0
    },
    "trailing_digits": 6,
    "type": 0
    },
    "relationships": {
    "owner": {
    "data": {
    "id": "GDWVBLD2W5KKKSRCZKDSCXHYBLECM7CM7SGYUVB23SN6H75D3XM4TG37",
    "type": "accounts"
    }
    }
    }
    },
    {
    "id": "CKK",
    "type": "assets",
    "attributes": {
    "available_for_issuance": "100.000000",
    "details": {
    "name": "CakeCoin",
    "logo": {
    "mime_type": "",
    "name": "",
    "key": "",
    "type": ""
    },
    "terms": {
    "mime_type": "",
    "name": "",
    "key": "",
    "type": ""
    },
    "stellar": {

    },
    "erc20": {

    }
    },
    "issued": "0.000000",
    "max_issuance_amount": "100.000000",
    "pending_issuance": "0.000000",
    "policies": {
    "value": 9,
    "flags": [
    {
    "name": "transferable",
    "value": 1
    },
    {
    "name": "withdrawable",
    "value": 8
    }
    ]
    },
    "pre_issuance_asset_signer": "GAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHV4",
    "state": {
    "name": "active",
    "value": 0
    },
    "trailing_digits": 6,
    "type": 0
    },
    "relationships": {
    "owner": {
    "data": {
    "id": "GDVMIJR2QLNNUXY46TKENPL2P2VXVT75LQUXSOUC6OJAZJFIR67K6V62",
    "type": "accounts"
    }
    }
    }
    },
    {
    "id": "CODEDCASH",
    "type": "assets",
    "attributes": {
    "available_for_issuance": "1000000000.000000",
    "details": {
    "name": "CODEDCASH",
    "logo": {
    "mime_type": "image/png",
    "name": "custom_square_v2.png",
    "key": "dpurex4inhucy6yry2t4zt4p2yunyf5elovq6d3au5epeil3xcdz4lx4ofq3kviawnct6p5f2z2akxqcnltaklys",
    "type": ""
    },
    "terms": {
    "mime_type": "",
    "name": "",
    "key": "",
    "type": ""
    },
    "stellar": {

    }
    },
    "issued": "0.000000",
    "max_issuance_amount": "1000000000.000000",
    "pending_issuance": "0.000000",
    "policies": {
    "value": 105,
    "flags": [
    {
    "name": "transferable",
    "value": 1
    },
    {
    "name": "withdrawable",
    "value": 8
    },
    {
    "name": "can_be_base_in_atomic_swap",
    "value": 32
    },
    {
    "name": "can_be_quote_in_atomic_swap",
    "value": 64
    }
    ]
    },
    "pre_issuance_asset_signer": "GAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHV4",
    "state": {
    "name": "active",
    "value": 0
    },
    "trailing_digits": 6,
    "type": 0
    },
    "relationships": {
    "owner": {
    "data": {
    "id": "GCZWZX7TWIAD4GSB766AS5M6QNPSXYNIYLBMXE65ISNEEN6EWLHV5DKA",
    "type": "accounts"
    }
    }
    }
    },
    {
    "id": "CORP",
    "type": "assets",
    "attributes": {
    "available_for_issuance": "9223366620956.925341",
    "details": {
    "name": "CORPORATE",
    "logo": {
    "mime_type": "",
    "name": "",
    "key": "",
    "type": ""
    },
    "terms": {
    "mime_type": "",
    "name": "",
    "key": "",
    "type": ""
    },
    "stellar": {

    },
    "erc20": {

    }
    },
    "issued": "5415897.850466",
    "max_issuance_amount": "9223372036854.775807",
    "pending_issuance": "0.000000",
    "policies": {
    "value": 97,
    "flags": [
    {
    "name": "transferable",
    "value": 1
    },
    {
    "name": "can_be_base_in_atomic_swap",
    "value": 32
    },
    {
    "name": "can_be_quote_in_atomic_swap",
    "value": 64
    }
    ]
    },
    "pre_issuance_asset_signer": "GAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHV4",
    "state": {
    "name": "active",
    "value": 0
    },
    "trailing_digits": 6,
    "type": 0
    },
    "relationships": {
    "owner": {
    "data": {
    "id": "GBFC6RWHFF6X46Q2Z57HCTVYZQCQ342T3DMRA5VY6STXYAKN54D5ERZM",
    "type": "accounts"
    }
    }
    }
    },
    {
    "id": "CRT",
    "type": "assets",
    "attributes": {
    "available_for_issuance": "1000.000000",
    "details": {
    "name": "Critonia",
    "logo": {
    "mime_type": "",
    "name": "",
    "key": "",
    "type": ""
    },
    "terms": {
    "mime_type": "",
    "name": "",
    "key": "",
    "type": ""
    },
    "stellar": {

    },
    "erc20": {

    }
    },
    "issued": "0.000000",
    "max_issuance_amount": "1000.000000",
    "pending_issuance": "0.000000",
    "policies": {
    "value": 1,
    "flags": [
    {
    "name": "transferable",
    "value": 1
    }
    ]
    },
    "pre_issuance_asset_signer": "GAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHV4",
    "state": {
    "name": "active",
    "value": 0
    },
    "trailing_digits": 6,
    "type": 1
    },
    "relationships": {
    "owner": {
    "data": {
    "id": "GALS7JYH2HF4U73HDBG6DPOQFMG4PXJMNEVDY3O66OG5VTI3QBVKJHH7",
    "type": "accounts"
    }
    }
    }
    }
        ],
        "included": [

        ],
        "links": {
        "first": "",
        "last": "",
        "next": "/v3/assets?page%5Blimit%5D=15&page%5Bnumber%5D=1&page%5Border%5D=asc",
        "prev": "",
        "self": "/v3/assets?page%5Blimit%5D=15&page%5Bnumber%5D=0&page%5Border%5D=asc"
        }
    }""");
  }

  test('adds one to input values', () async {
    // final baseUrl = "https://api.demo.tokend.io/v3";
    final json = await parseJsonFromAssets('assets/test_assets.json');
    final resultJson = Japx.decode(json);
    final assetsModel = AssetsModel.fromMap(resultJson['data'][0]);
    print(assetsModel.id);
  });
}
