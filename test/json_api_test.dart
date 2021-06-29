import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_test/flutter_test.dart';
import 'package:japx/japx.dart';

import 'AssetsModel.dart';

void main() {
  Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
    print('--- Parse json from: $assetsPath');
    // final String jsonString = await rootBundle.loadString(assetsPath);
     jsonDecode("""{
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
    return jsonDecode("""{"data":{"id":"DOGE","type":"converted-balances-collections","relationships":{"asset":{"data":{"id":"DOGE","type":"assets"}},"states":{"data":[{"id":"BA46H5BBLLKJF3US5OMHUUGW2FZE2OSBZSK3S4PYR4XZLM7B75IH6CQ3","type":"converted-balance-states"},{"id":"BDRGT2Y2BYS3KOVWEOF4NF5SCAP32VVF42KK33ISGTS2ERPTUQNFWNN5","type":"converted-balance-states"},{"id":"BAYSS7J4CTTAXHAYY2YPJ4FDN2OCKE2OCPBARFRRVWZDRCZAEBXF2HJB","type":"converted-balance-states"},{"id":"BDF46GEQSI7IGWMED2PD5KEP3LF5FDGLGZ7K5SUFJGJAJ5VYF3L5LG36","type":"converted-balance-states"},{"id":"BAL2GZLXWIXGGI4JSY7WSLRHBVRQKMZXRO2462HHRJ2IFBVJQ6AMSZDL","type":"converted-balance-states"},{"id":"BBA7M3JB6MIQOP2O5DQNHDQ6TKI7IPVZNN7DQO7QE43NIVA53DIS4CIQ","type":"converted-balance-states"},{"id":"BBWUXTAS5RSMUMZPGMB5STTIFG7VO3DNHNXSTQXIBXRVMWVINIETGAGI","type":"converted-balance-states"},{"id":"BDOU26NTST7BXZCDULCPGQJMKU7AOD7VE36OQ2ROYXPER76PQ3HFPILG","type":"converted-balance-states"},{"id":"BBP3OCY3QIKSLUYBVWHFDQTBYEUSABLP5GI3YV5RZKKCCBJACC7JE7OZ","type":"converted-balance-states"},{"id":"BC6ZHHBXIJLWHZF7XSECOLV6KOUNSMFE2554EA3W5WPG2S3XG2EFCG7F","type":"converted-balance-states"},{"id":"BCWLH3EPFXJMG53DKJI5KAHIXOFGSUDY6GPRLTCDRB6XSOOTSQK2BQTA","type":"converted-balance-states"},{"id":"BCEQH42OYQFHQWDE6KQQ5BUPZKIWDSGCVCY6UIQDWLZJ2WL2GXQ2TUG5","type":"converted-balance-states"},{"id":"BCEV7JBGYUSLNO67TUKSYWQRFWOKBQST3D4G3Y3E4WO5FFBYAP2AMNVC","type":"converted-balance-states"}]}}},"included":[{"id":"BBWUXTAS5RSMUMZPGMB5STTIFG7VO3DNHNXSTQXIBXRVMWVINIETGAGI","type":"balances","relationships":{"asset":{"data":{"id":"NICOLAS","type":"assets"}},"state":{"data":{"id":"BBWUXTAS5RSMUMZPGMB5STTIFG7VO3DNHNXSTQXIBXRVMWVINIETGAGI","type":"balances-state"}}}},{"id":"BBWUXTAS5RSMUMZPGMB5STTIFG7VO3DNHNXSTQXIBXRVMWVINIETGAGI","type":"balances-state","attributes":{"available":"0.000000","locked":"0.000000"}},{"id":"XLM","type":"assets","attributes":{"available_for_issuance":"8983934.770000","details":{"name":"Lumen","external_system_type":"3","is_coinpayments":false,"logo":{"key":"","type":""},"terms":{"key":"","type":"","name":""},"stellar":{"withdraw":true,"deposit":true,"asset_type":"native","asset_code":"XLM"},"erc20":{}},"issued":"1013084.230000","max_issuance_amount":"9223372036854.775807","pending_issuance":"0.000000","policies":{"value":107,"flags":[{"name":"transferable","value":1},{"name":"base_asset","value":2},{"name":"withdrawable","value":8},{"name":"can_be_base_in_atomic_swap","value":32},{"name":"can_be_quote_in_atomic_swap","value":64}]},"pre_issuance_asset_signer":"GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5","state":{"name":"active","value":0},"trailing_digits":6,"type":0},"relationships":{"owner":{"data":{"id":"GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5","type":"accounts"}}}},{"id":"BDRGT2Y2BYS3KOVWEOF4NF5SCAP32VVF42KK33ISGTS2ERPTUQNFWNN5","type":"balances-state","attributes":{"available":"10673.750000","locked":"100.000000"}},{"id":"CSTT","type":"assets","attributes":{"available_for_issuance":"9223372036767.275807","details":{"name":"CustomToken","logo":{"mime_type":"","name":"","key":"","type":""},"terms":{"mime_type":"","name":"","key":"","type":""},"stellar":{}},"issued":"87.500000","max_issuance_amount":"9223372036854.775807","pending_issuance":"0.000000","policies":{"value":9,"flags":[{"name":"transferable","value":1},{"name":"withdrawable","value":8}]},"pre_issuance_asset_signer":"GAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHV4","state":{"name":"active","value":0},"trailing_digits":6,"type":0},"relationships":{"owner":{"data":{"id":"GALS7JYH2HF4U73HDBG6DPOQFMG4PXJMNEVDY3O66OG5VTI3QBVKJHH7","type":"accounts"}}}},{"id":"BDF46GEQSI7IGWMED2PD5KEP3LF5FDGLGZ7K5SUFJGJAJ5VYF3L5LG36","type":"converted-balance-states","attributes":{"converted_amounts":{"available":"100000000.000000","locked":"0.000000"},"initial_amounts":{"available":"100000000.000000","locked":"0.000000"},"is_converted":true,"price":"1.000000"},"relationships":{"balance":{"data":{"id":"BDF46GEQSI7IGWMED2PD5KEP3LF5FDGLGZ7K5SUFJGJAJ5VYF3L5LG36","type":"balances"}}}},{"id":"BC6ZHHBXIJLWHZF7XSECOLV6KOUNSMFE2554EA3W5WPG2S3XG2EFCG7F","type":"balances","relationships":{"asset":{"data":{"id":"LTCT","type":"assets"}},"state":{"data":{"id":"BC6ZHHBXIJLWHZF7XSECOLV6KOUNSMFE2554EA3W5WPG2S3XG2EFCG7F","type":"balances-state"}}}},{"id":"BCEV7JBGYUSLNO67TUKSYWQRFWOKBQST3D4G3Y3E4WO5FFBYAP2AMNVC","type":"balances-state","attributes":{"available":"0.000000","locked":"0.000000"}},{"id":"BCWLH3EPFXJMG53DKJI5KAHIXOFGSUDY6GPRLTCDRB6XSOOTSQK2BQTA","type":"converted-balance-states","attributes":{"converted_amounts":{"available":"0.000000","locked":"0.000000"},"initial_amounts":{"available":"0.000000","locked":"0.000000"},"is_converted":false,"price":"0.000000"},"relationships":{"balance":{"data":{"id":"BCWLH3EPFXJMG53DKJI5KAHIXOFGSUDY6GPRLTCDRB6XSOOTSQK2BQTA","type":"balances"}}}},{"id":"LTCT","type":"assets","attributes":{"available_for_issuance":"82500000.000000","details":{"name":"Testnet Litecoin","external_system_type":"","is_coinpayments":true,"logo":{"key":"","type":""},"terms":{"key":"","type":"","name":""},"stellar":{},"erc20":{}},"issued":"0.000000","max_issuance_amount":"82500000.000000","pending_issuance":"0.000000","policies":{"value":67,"flags":[{"name":"transferable","value":1},{"name":"base_asset","value":2},{"name":"can_be_quote_in_atomic_swap","value":64}]},"pre_issuance_asset_signer":"GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5","state":{"name":"active","value":0},"trailing_digits":6,"type":0},"relationships":{"owner":{"data":{"id":"GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5","type":"accounts"}}}},{"id":"BBP3OCY3QIKSLUYBVWHFDQTBYEUSABLP5GI3YV5RZKKCCBJACC7JE7OZ","type":"balances","relationships":{"asset":{"data":{"id":"XLM","type":"assets"}},"state":{"data":{"id":"BBP3OCY3QIKSLUYBVWHFDQTBYEUSABLP5GI3YV5RZKKCCBJACC7JE7OZ","type":"balances-state"}}}},{"id":"BAL2GZLXWIXGGI4JSY7WSLRHBVRQKMZXRO2462HHRJ2IFBVJQ6AMSZDL","type":"balances","relationships":{"asset":{"data":{"id":"EUR","type":"assets"}},"state":{"data":{"id":"BAL2GZLXWIXGGI4JSY7WSLRHBVRQKMZXRO2462HHRJ2IFBVJQ6AMSZDL","type":"balances-state"}}}},{"id":"BA46H5BBLLKJF3US5OMHUUGW2FZE2OSBZSK3S4PYR4XZLM7B75IH6CQ3","type":"balances","relationships":{"asset":{"data":{"id":"CSTT","type":"assets"}},"state":{"data":{"id":"BA46H5BBLLKJF3US5OMHUUGW2FZE2OSBZSK3S4PYR4XZLM7B75IH6CQ3","type":"balances-state"}}}},{"id":"BA46H5BBLLKJF3US5OMHUUGW2FZE2OSBZSK3S4PYR4XZLM7B75IH6CQ3","type":"converted-balance-states","attributes":{"converted_amounts":{"available":"2869983959.375000","locked":"0.000000"},"initial_amounts":{"available":"62.500000","locked":"0.000000"},"is_converted":true,"price":"45919743.350000"},"relationships":{"balance":{"data":{"id":"BA46H5BBLLKJF3US5OMHUUGW2FZE2OSBZSK3S4PYR4XZLM7B75IH6CQ3","type":"balances"}}}},{"id":"BCEQH42OYQFHQWDE6KQQ5BUPZKIWDSGCVCY6UIQDWLZJ2WL2GXQ2TUG5","type":"converted-balance-states","attributes":{"converted_amounts":{"available":"0.000000","locked":"0.000000"},"initial_amounts":{"available":"0.000000","locked":"0.000000"},"is_converted":false,"price":"0.000000"},"relationships":{"balance":{"data":{"id":"BCEQH42OYQFHQWDE6KQQ5BUPZKIWDSGCVCY6UIQDWLZJ2WL2GXQ2TUG5","type":"balances"}}}},{"id":"BBA7M3JB6MIQOP2O5DQNHDQ6TKI7IPVZNN7DQO7QE43NIVA53DIS4CIQ","type":"balances","relationships":{"asset":{"data":{"id":"PEOPLE","type":"assets"}},"state":{"data":{"id":"BBA7M3JB6MIQOP2O5DQNHDQ6TKI7IPVZNN7DQO7QE43NIVA53DIS4CIQ","type":"balances-state"}}}},{"id":"NICOLAS","type":"assets","attributes":{"available_for_issuance":"99958500.000000","details":{"name":"NNICOLAS","external_system_type":"","is_coinpayments":false,"logo":{"key":"","type":""},"terms":{"key":"","type":"","name":""},"stellar":{},"erc20":{}},"issued":"41500.000000","max_issuance_amount":"200000000.000000","pending_issuance":"0.000000","policies":{"value":3,"flags":[{"name":"transferable","value":1},{"name":"base_asset","value":2}]},"pre_issuance_asset_signer":"GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5","state":{"name":"active","value":0},"trailing_digits":6,"type":1},"relationships":{"owner":{"data":{"id":"GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5","type":"accounts"}}}},{"id":"BBA7M3JB6MIQOP2O5DQNHDQ6TKI7IPVZNN7DQO7QE43NIVA53DIS4CIQ","type":"balances-state","attributes":{"available":"0.000000","locked":"0.000000"}},{"id":"BDOU26NTST7BXZCDULCPGQJMKU7AOD7VE36OQ2ROYXPER76PQ3HFPILG","type":"balances","relationships":{"asset":{"data":{"id":"RM","type":"assets"}},"state":{"data":{"id":"BDOU26NTST7BXZCDULCPGQJMKU7AOD7VE36OQ2ROYXPER76PQ3HFPILG","type":"balances-state"}}}},{"id":"BDOU26NTST7BXZCDULCPGQJMKU7AOD7VE36OQ2ROYXPER76PQ3HFPILG","type":"balances-state","attributes":{"available":"0.000000","locked":"0.000000"}},{"id":"BDRGT2Y2BYS3KOVWEOF4NF5SCAP32VVF42KK33ISGTS2ERPTUQNFWNN5","type":"balances","relationships":{"asset":{"data":{"id":"USD","type":"assets"}},"state":{"data":{"id":"BDRGT2Y2BYS3KOVWEOF4NF5SCAP32VVF42KK33ISGTS2ERPTUQNFWNN5","type":"balances-state"}}}},{"id":"USD","type":"assets","attributes":{"available_for_issuance":"9223239723378.000000","details":{"name":"US Dollar","external_system_type":"0","logo":{"key":"","type":""},"terms":{"key":"","type":"","name":""},"stellar":{},"erc20":{}},"issued":"132313025.000000","max_issuance_amount":"9223372036853.000000","pending_issuance":"0.000000","policies":{"value":11,"flags":[{"name":"transferable","value":1},{"name":"base_asset","value":2},{"name":"withdrawable","value":8}]},"pre_issuance_asset_signer":"GBA4EX43M25UPV4WIE6RRMQOFTWXZZRIPFAI5VPY6Z2ZVVXVWZ6NEOOB","state":{"name":"active","value":0},"trailing_digits":6,"type":0},"relationships":{"owner":{"data":{"id":"GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5","type":"accounts"}}}},{"id":"BDRGT2Y2BYS3KOVWEOF4NF5SCAP32VVF42KK33ISGTS2ERPTUQNFWNN5","type":"converted-balance-states","attributes":{"converted_amounts":{"available":"475895441.262500","locked":"4458559.000000"},"initial_amounts":{"available":"10673.750000","locked":"100.000000"},"is_converted":true,"price":"44585.590000"},"relationships":{"balance":{"data":{"id":"BDRGT2Y2BYS3KOVWEOF4NF5SCAP32VVF42KK33ISGTS2ERPTUQNFWNN5","type":"balances"}}}},{"id":"BCWLH3EPFXJMG53DKJI5KAHIXOFGSUDY6GPRLTCDRB6XSOOTSQK2BQTA","type":"balances","relationships":{"asset":{"data":{"id":"Bym","type":"assets"}},"state":{"data":{"id":"BCWLH3EPFXJMG53DKJI5KAHIXOFGSUDY6GPRLTCDRB6XSOOTSQK2BQTA","type":"balances-state"}}}},{"id":"BBWUXTAS5RSMUMZPGMB5STTIFG7VO3DNHNXSTQXIBXRVMWVINIETGAGI","type":"converted-balance-states","attributes":{"converted_amounts":{"available":"0.000000","locked":"0.000000"},"initial_amounts":{"available":"0.000000","locked":"0.000000"},"is_converted":false,"price":"0.000000"},"relationships":{"balance":{"data":{"id":"BBWUXTAS5RSMUMZPGMB5STTIFG7VO3DNHNXSTQXIBXRVMWVINIETGAGI","type":"balances"}}}},{"id":"BBA7M3JB6MIQOP2O5DQNHDQ6TKI7IPVZNN7DQO7QE43NIVA53DIS4CIQ","type":"converted-balance-states","attributes":{"converted_amounts":{"available":"0.000000","locked":"0.000000"},"initial_amounts":{"available":"0.000000","locked":"0.000000"},"is_converted":true,"price":"0.000000"},"relationships":{"balance":{"data":{"id":"BBA7M3JB6MIQOP2O5DQNHDQ6TKI7IPVZNN7DQO7QE43NIVA53DIS4CIQ","type":"balances"}}}},{"id":"NIC","type":"assets","attributes":{"available_for_issuance":"98000000.000000","details":{"name":"NICO","external_system_type":"","is_coinpayments":false,"logo":{"key":"dpurgh4ing3gnlbw46rplvwpxjtmfj6xvhyaco2sy5j2gauakydfjz2ssb7z7e4cnjbvkws4o4vwhqca4oqhimb6","type":"image/png"},"terms":{"key":"","type":"","name":""},"stellar":{},"erc20":{}},"issued":"2000000.000000","max_issuance_amount":"1000000000.000000","pending_issuance":"0.000000","policies":{"value":3,"flags":[{"name":"transferable","value":1},{"name":"base_asset","value":2}]},"pre_issuance_asset_signer":"GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5","state":{"name":"active","value":0},"trailing_digits":6,"type":1},"relationships":{"owner":{"data":{"id":"GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5","type":"accounts"}}}},{"id":"BCEQH42OYQFHQWDE6KQQ5BUPZKIWDSGCVCY6UIQDWLZJ2WL2GXQ2TUG5","type":"balances","relationships":{"asset":{"data":{"id":"NTTM000","type":"assets"}},"state":{"data":{"id":"BCEQH42OYQFHQWDE6KQQ5BUPZKIWDSGCVCY6UIQDWLZJ2WL2GXQ2TUG5","type":"balances-state"}}}},{"id":"BCEQH42OYQFHQWDE6KQQ5BUPZKIWDSGCVCY6UIQDWLZJ2WL2GXQ2TUG5","type":"balances-state","attributes":{"available":"0.000000","locked":"0.000000"}},{"id":"BBP3OCY3QIKSLUYBVWHFDQTBYEUSABLP5GI3YV5RZKKCCBJACC7JE7OZ","type":"balances-state","attributes":{"available":"0.000000","locked":"0.000000"}},{"id":"BTC","type":"assets","attributes":{"available_for_issuance":"18995269.400000","details":{"name":"Bitcoin"},"issued":"2004730.600000","max_issuance_amount":"21000000.000000","pending_issuance":"0.000000","policies":{"value":3,"flags":[{"name":"transferable","value":1},{"name":"base_asset","value":2}]},"pre_issuance_asset_signer":"GBA4EX43M25UPV4WIE6RRMQOFTWXZZRIPFAI5VPY6Z2ZVVXVWZ6NEOOB","state":{"name":"active","value":0},"trailing_digits":6,"type":0},"relationships":{"owner":{"data":{"id":"GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5","type":"accounts"}}}},{"id":"BAL2GZLXWIXGGI4JSY7WSLRHBVRQKMZXRO2462HHRJ2IFBVJQ6AMSZDL","type":"balances-state","attributes":{"available":"445.000000","locked":"0.000000"}},{"id":"BA46H5BBLLKJF3US5OMHUUGW2FZE2OSBZSK3S4PYR4XZLM7B75IH6CQ3","type":"balances-state","attributes":{"available":"62.500000","locked":"0.000000"}},{"id":"BDF46GEQSI7IGWMED2PD5KEP3LF5FDGLGZ7K5SUFJGJAJ5VYF3L5LG36","type":"balances","relationships":{"asset":{"data":{"id":"DOGE","type":"assets"}},"state":{"data":{"id":"BDF46GEQSI7IGWMED2PD5KEP3LF5FDGLGZ7K5SUFJGJAJ5VYF3L5LG36","type":"balances-state"}}}},{"id":"BCWLH3EPFXJMG53DKJI5KAHIXOFGSUDY6GPRLTCDRB6XSOOTSQK2BQTA","type":"balances-state","attributes":{"available":"0.000000","locked":"0.000000"}},{"id":"BCEV7JBGYUSLNO67TUKSYWQRFWOKBQST3D4G3Y3E4WO5FFBYAP2AMNVC","type":"balances","relationships":{"asset":{"data":{"id":"NIC","type":"assets"}},"state":{"data":{"id":"BCEV7JBGYUSLNO67TUKSYWQRFWOKBQST3D4G3Y3E4WO5FFBYAP2AMNVC","type":"balances-state"}}}},{"id":"PEOPLE","type":"assets","attributes":{"available_for_issuance":"448898.000000","details":{"name":"PEOPLE","external_system_type":"","is_coinpayments":false,"logo":{"key":"","type":""},"terms":{"key":"","type":"","name":""},"stellar":{},"erc20":{}},"issued":"51102.000000","max_issuance_amount":"1000000.000000","pending_issuance":"0.000000","policies":{"value":107,"flags":[{"name":"transferable","value":1},{"name":"base_asset","value":2},{"name":"withdrawable","value":8},{"name":"can_be_base_in_atomic_swap","value":32},{"name":"can_be_quote_in_atomic_swap","value":64}]},"pre_issuance_asset_signer":"GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5","state":{"name":"active","value":0},"trailing_digits":6,"type":0},"relationships":{"owner":{"data":{"id":"GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5","type":"accounts"}}}},{"id":"EUR","type":"assets","attributes":{"available_for_issuance":"9223348408970.775807","details":{"name":"Euro","external_system_type":"","is_coinpayments":false,"logo":{"key":"","type":""},"terms":{"key":"","type":"","name":""},"stellar":{},"erc20":{}},"issued":"23627884.000000","max_issuance_amount":"9223372036854.775807","pending_issuance":"0.000000","policies":{"value":11,"flags":[{"name":"transferable","value":1},{"name":"base_asset","value":2},{"name":"withdrawable","value":8}]},"pre_issuance_asset_signer":"GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5","state":{"name":"active","value":0},"trailing_digits":6,"type":0},"relationships":{"owner":{"data":{"id":"GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5","type":"accounts"}}}},{"id":"BAL2GZLXWIXGGI4JSY7WSLRHBVRQKMZXRO2462HHRJ2IFBVJQ6AMSZDL","type":"converted-balance-states","attributes":{"converted_amounts":{"available":"19840587.550000","locked":"0.000000"},"initial_amounts":{"available":"445.000000","locked":"0.000000"},"is_converted":true,"price":"44585.590000"},"relationships":{"balance":{"data":{"id":"BAL2GZLXWIXGGI4JSY7WSLRHBVRQKMZXRO2462HHRJ2IFBVJQ6AMSZDL","type":"balances"}}}},{"id":"BCEV7JBGYUSLNO67TUKSYWQRFWOKBQST3D4G3Y3E4WO5FFBYAP2AMNVC","type":"converted-balance-states","attributes":{"converted_amounts":{"available":"0.000000","locked":"0.000000"},"initial_amounts":{"available":"0.000000","locked":"0.000000"},"is_converted":false,"price":"0.000000"},"relationships":{"balance":{"data":{"id":"BCEV7JBGYUSLNO67TUKSYWQRFWOKBQST3D4G3Y3E4WO5FFBYAP2AMNVC","type":"balances"}}}},{"id":"DOGE","type":"assets","attributes":{"available_for_issuance":"9223252034753.000000","details":{"name":"Dogecoin","logo":{"key":"","type":""},"terms":{"key":"","type":"","name":""},"stellar":{},"erc20":{}},"issued":"120002100.000000","max_issuance_amount":"9223372036853.000000","pending_issuance":"0.000000","policies":{"value":7,"flags":[{"name":"transferable","value":1},{"name":"base_asset","value":2},{"name":"stats_quote_asset","value":4}]},"pre_issuance_asset_signer":"GBA4EX43M25UPV4WIE6RRMQOFTWXZZRIPFAI5VPY6Z2ZVVXVWZ6NEOOB","state":{"name":"active","value":0},"trailing_digits":6,"type":0},"relationships":{"owner":{"data":{"id":"GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5","type":"accounts"}}}},{"id":"Bym","type":"assets","attributes":{"available_for_issuance":"0.000000","details":{"name":"Byom","external_system_type":"","is_coinpayments":true,"logo":{"key":"dpurgh4inhqc7sosp4kflcozqj2xojxakeewt6t5slncfyeqg7betejfaxs4nyfczhzpnkarnop75o2rgnkvv3bq","type":"image/jpeg"},"terms":{"key":"","type":"","name":""},"stellar":{"withdraw":true,"deposit":true,"asset_type":"credit_alphanum12","asset_code":"ByomT"},"erc20":{}},"issued":"0.000000","max_issuance_amount":"1000.000000","pending_issuance":"0.000000","policies":{"value":11,"flags":[{"name":"transferable","value":1},{"name":"base_asset","value":2},{"name":"withdrawable","value":8}]},"pre_issuance_asset_signer":"GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5","state":{"name":"active","value":0},"trailing_digits":6,"type":1},"relationships":{"owner":{"data":{"id":"GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5","type":"accounts"}}}},{"id":"BAYSS7J4CTTAXHAYY2YPJ4FDN2OCKE2OCPBARFRRVWZDRCZAEBXF2HJB","type":"converted-balance-states","attributes":{"converted_amounts":{"available":"472973356.505000","locked":"0.000000"},"initial_amounts":{"available":"10.300000","locked":"0.000000"},"is_converted":true,"price":"45919743.350000"},"relationships":{"balance":{"data":{"id":"BAYSS7J4CTTAXHAYY2YPJ4FDN2OCKE2OCPBARFRRVWZDRCZAEBXF2HJB","type":"balances"}}}},{"id":"BBP3OCY3QIKSLUYBVWHFDQTBYEUSABLP5GI3YV5RZKKCCBJACC7JE7OZ","type":"converted-balance-states","attributes":{"converted_amounts":{"available":"0.000000","locked":"0.000000"},"initial_amounts":{"available":"0.000000","locked":"0.000000"},"is_converted":false,"price":"0.000000"},"relationships":{"balance":{"data":{"id":"BBP3OCY3QIKSLUYBVWHFDQTBYEUSABLP5GI3YV5RZKKCCBJACC7JE7OZ","type":"balances"}}}},{"id":"BC6ZHHBXIJLWHZF7XSECOLV6KOUNSMFE2554EA3W5WPG2S3XG2EFCG7F","type":"converted-balance-states","attributes":{"converted_amounts":{"available":"0.000000","locked":"0.000000"},"initial_amounts":{"available":"0.000000","locked":"0.000000"},"is_converted":false,"price":"0.000000"},"relationships":{"balance":{"data":{"id":"BC6ZHHBXIJLWHZF7XSECOLV6KOUNSMFE2554EA3W5WPG2S3XG2EFCG7F","type":"balances"}}}},{"id":"BDF46GEQSI7IGWMED2PD5KEP3LF5FDGLGZ7K5SUFJGJAJ5VYF3L5LG36","type":"balances-state","attributes":{"available":"100000000.000000","locked":"0.000000"}},{"id":"NTTM000","type":"assets","attributes":{"available_for_issuance":"0.000000","details":{"name":"NT_TM000","external_system_type":"","is_coinpayments":false,"logo":{"key":"","type":""},"terms":{"key":"","type":"","name":""},"stellar":{},"erc20":{}},"issued":"1000.000000","max_issuance_amount":"100000.000000","pending_issuance":"0.000000","policies":{"value":99,"flags":[{"name":"transferable","value":1},{"name":"base_asset","value":2},{"name":"can_be_base_in_atomic_swap","value":32},{"name":"can_be_quote_in_atomic_swap","value":64}]},"pre_issuance_asset_signer":"GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5","state":{"name":"active","value":0},"trailing_digits":6,"type":1},"relationships":{"owner":{"data":{"id":"GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5","type":"accounts"}}}},{"id":"RM","type":"assets","attributes":{"available_for_issuance":"499000.000000","details":{"name":"REAL MADRID ASSET","external_system_type":"","is_coinpayments":false,"logo":{"key":"dpurgh4ing3gnlbw46rplvwpxjtmfj6xvhyaco2sy5j2gauakydfjz2ssb7z753c4civk2wopxtst6zkecbzdics","type":"image/png"},"terms":{"key":"","type":"","name":""},"stellar":{},"erc20":{}},"issued":"1000.000000","max_issuance_amount":"1000000.000000","pending_issuance":"0.000000","policies":{"value":99,"flags":[{"name":"transferable","value":1},{"name":"base_asset","value":2},{"name":"can_be_base_in_atomic_swap","value":32},{"name":"can_be_quote_in_atomic_swap","value":64}]},"pre_issuance_asset_signer":"GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5","state":{"name":"active","value":0},"trailing_digits":6,"type":0},"relationships":{"owner":{"data":{"id":"GC3W5RYFYTFRDBA5B5KCB7MPLAINR6NWUZJBQEYY4UCFTM5QDHFXHYB5","type":"accounts"}}}},{"id":"BAYSS7J4CTTAXHAYY2YPJ4FDN2OCKE2OCPBARFRRVWZDRCZAEBXF2HJB","type":"balances","relationships":{"asset":{"data":{"id":"BTC","type":"assets"}},"state":{"data":{"id":"BAYSS7J4CTTAXHAYY2YPJ4FDN2OCKE2OCPBARFRRVWZDRCZAEBXF2HJB","type":"balances-state"}}}},{"id":"BAYSS7J4CTTAXHAYY2YPJ4FDN2OCKE2OCPBARFRRVWZDRCZAEBXF2HJB","type":"balances-state","attributes":{"available":"10.300000","locked":"0.000000"}},{"id":"BDOU26NTST7BXZCDULCPGQJMKU7AOD7VE36OQ2ROYXPER76PQ3HFPILG","type":"converted-balance-states","attributes":{"converted_amounts":{"available":"0.000000","locked":"0.000000"},"initial_amounts":{"available":"0.000000","locked":"0.000000"},"is_converted":false,"price":"0.000000"},"relationships":{"balance":{"data":{"id":"BDOU26NTST7BXZCDULCPGQJMKU7AOD7VE36OQ2ROYXPER76PQ3HFPILG","type":"balances"}}}},{"id":"BC6ZHHBXIJLWHZF7XSECOLV6KOUNSMFE2554EA3W5WPG2S3XG2EFCG7F","type":"balances-state","attributes":{"available":"0.000000","locked":"0.000000"}}]}
""");
  }

  test('adds one to input values', () async {
    // final baseUrl = "https://api.demo.tokend.io/v3";
    final json = await parseJsonFromAssets('assets/test_assets.json');
    final resultJson = Japx.decode(json);
    print(resultJson);
    final assetsModel = AssetsModel.fromMap(resultJson['data'][0]);
    print(assetsModel.id);
  });
}
