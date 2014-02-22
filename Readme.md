# NYMnemonic

Easy BIP-39 style mnemonic code generation.


Usage:
```objc

// Generating a mnemonic
NSString *mnemonic = [NYMnemonic generateMnemonicString:@128 language:@"english"];
//=> @"letter advice cage absurd amount doctor acoustic avoid letter advice cage above"

NSString *seed = [NYMnemonic deterministicSeedStringFromMnemonicString:mnemonic
                                                            passphrase:@""
                                                              language:@"english"];
//=> " d71de856f81a8acc65e6fc851a38d4d7ec216fd0796d0a6827a3ad6ed5511a30fa280f12eb2e47ed2ac03b5c462a0358d18d69fe4f985ec81778c1b370b652a8"
```
