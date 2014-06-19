ios-KRAes-Algorithm
=================

This's AES256 encrypt algorithm.

``` objective-c
#import "KRAes.h"

-(void)testSample
{
    NSString *_content   = @"Something wanna keep secret ...";
    NSData *_encryptData = [[KRAes sharedAes] encryptAES256WithData:[_content dataUsingEncoding:NSUTF8StringEncoding] password:@"12345"];
    NSData *_decryptData = [[KRAes sharedAes] decryptAES256WithData:_encryptData password:@"12345"];
    NSString *_restoredContent = [[NSString alloc] initWithData:_decryptData encoding:NSUTF8StringEncoding];
    
    NSLog(@"_restoredContent : %@", _restoredContent);
}
```

## Version

V1.0

## License

MIT.
