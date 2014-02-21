#import "NYMnemonic.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(NYMnemonicSpec)

describe(@"NYMnemonic", ^{
  NSString *currentFilePath = [NSString stringWithUTF8String:__FILE__];
  NSString *path = [NSString
      stringWithFormat:@"%@/../tests/vectors.json",
                       [currentFilePath stringByDeletingLastPathComponent]];

  NSError *error = nil;
  id __block object = [NSJSONSerialization
      JSONObjectWithData:[NSData dataWithContentsOfFile:path]
                 options:0
                   error:&error];

  it(@"Should correctly encode the test vectors:", ^{
    for (NSArray *test in [object objectForKey:@"english"]) {
      [NYMnemonic
          mnemonicStringFromRandomHexString:test[0]
                                   language:@"english"] should equal(test[1]);
    }
  });

  it(@"Should correctly decode the test vectors:", ^{
    for (NSArray *test in [object objectForKey:@"english"]) {
      [NYMnemonic deterministicSeedStringFromMnemonicString:test[1]
                                                 passphrase:@"TREZOR"
                                                   language:@"english"] should
      equal(test[2]);
    }
  });

  it(@"Should for sure pass this test:", ^{
    for (NSArray *test in [object objectForKey:@"english"]) {
      [NYMnemonic deterministicSeedStringFromMnemonicString:
              [NYMnemonic mnemonicStringFromRandomHexString:test[0]
                                                   language:@"english"]
                                                 passphrase:@"TREZOR"
                                                   language:@"english"] should
      equal(test[2]);
    }
  });

  it(@"It should generate correctly sized phrases.", ^{
    [[[NYMnemonic generateMnemonicString:@128 language:@"english"] componentsSeparatedByString:@" "] count] should equal(@12);
    [[[NYMnemonic generateMnemonicString:@256 language:@"english"] componentsSeparatedByString:@" "] count] should equal(@24);
  });

  it(@"It should throw on impropper strength sizes.", ^{
    ^{
      [NYMnemonic generateMnemonicString:@121 language:@"english"];
    } should raise_exception([NSException class]);
  });
});

SPEC_END