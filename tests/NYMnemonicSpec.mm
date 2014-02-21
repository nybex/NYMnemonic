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
      NSString *phrase = [NYMnemonic mnemonicStringFromSeed: test[0] usingLanguage:@"english"];
      NSLog(@"Mnemonic Phrase: %@\nShould Equal: %@\n\n", phrase, test[1]);
      phrase should equal(test[1]);
    }
  });
});

SPEC_END