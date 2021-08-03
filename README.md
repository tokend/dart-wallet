# TokenD Kotlin wallet

This library implements transactions and keys management for TokenD-related projects.

## Usage examples

Key management and signing:

```dart
var SEED = "SBUFJEEK7FMWXPE4HGOWQZPHZ4V5TFKGSF664RAGT24NS662MKTQ7J6S";
var DATA = Uint8List.fromList("TokenD is awesome".codeUnits);

var decoratedSignature = Account.fromSecretSeed(SEED).then((acc) => acc
        .signDecorated(DATA));
```

Transaction creation:

```dart
var SEED = "SBUFJEEK7FMWXPE4HGOWQZPHZ4V5TFKGSF664RAGT24NS662MKTQ7J6S";
    var NETWORK = NetworkParams("Example Test Network");

    var sourceAccount = await Account.fromSecretSeed(SEED);

    var accountId = sourceAccount.accountId;
    var operation =
        CreateBalanceOp(PublicKeyFactory.fromAccountId(accountId), "OLE");


    var transaction = await TransactionBuilder(NETWORK, PublicKeyFactory.fromAccountId(accountId))
        .addOperation(OperationBodyManageBalance(operation)).setMemo(MemoMemoText("TokenD is awesome"))
        .addSigner(sourceAccount)
        .build();

    var envelope = transaction.getEnvelope().toBase64();
```

Decoding:
```dart
var txResultEncoded = "AAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAJAAAAAAAAAADMOKDasWPzpJIqN9sWipdvcjEZRTnGBvUezXbEd6rKMAAAAAAAAAAA";
var stream = XdrDataInputStream(base64Decode(txResultEncoded));
var txResult = TransactionResult.fromXdr(stream);
```

## XDR Update
XDR sources are located in [TokenD XDR repository](https://github.com/tokend/xdr/).
You can generate new XDRs using our Docker-based XDR generator.
[Docker](https://www.docker.com/) is required to perform this action.

In order to generate new XDRs run `generateXDR` script with a source revision (tag or branch or commit) as an argument:

```bash
./generateXDR.sh master
```
