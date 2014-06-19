//
//  KRAES.m
//  KRAES
//
//  Created by Kalvar on 2014/6/19.
//  Copyright (c) 2014年 Kalvar. All rights reserved.
//

#import "KRAes.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation KRAes (fixAes256)

-(NSData *)_aes256WithData:(NSData *)_data key:(NSString *)_key isEncrypt:(BOOL)_isEncrypt
{
    //+1 is the check code.
    char _keyPattern[kCCKeySizeAES256 + 1];
    bzero(_keyPattern, sizeof(_keyPattern));
    [_key getCString:_keyPattern maxLength:sizeof(_keyPattern) encoding:NSUTF8StringEncoding];
    NSUInteger _dataLength = [_data length];
    size_t _bufferSize     = _dataLength + kCCBlockSizeAES128;
    void *_buffers         = malloc(_bufferSize);
    
    size_t _totalBytes = 0;
    CCCryptorStatus _cryptStatus;
    if( _isEncrypt )
    {
        _cryptStatus = CCCrypt(kCCEncrypt,
                               kCCAlgorithmAES128,
                               kCCOptionPKCS7Padding,
                               _keyPattern,
                               kCCKeySizeAES256,
                               NULL,
                               [_data bytes],
                               _dataLength,
                               _buffers,
                               _bufferSize,
                               &_totalBytes);
    }
    else
    {
        _cryptStatus = CCCrypt(kCCDecrypt,
                               kCCAlgorithmAES128,
                               kCCOptionPKCS7Padding,
                               _keyPattern,
                               kCCKeySizeAES256,
                               NULL,
                               [_data bytes],
                               _dataLength,
                               _buffers,
                               _bufferSize,
                               &_totalBytes);
    }
    
    
    if (_cryptStatus == kCCSuccess)
    {
        return [NSMutableData dataWithBytesNoCopy:_buffers length:_totalBytes];
    }
    
    free(_buffers);
    return nil;
}

@end

@implementation KRAes

+(instancetype)sharedAes
{
    static dispatch_once_t pred;
    static KRAes *_object = nil;
    dispatch_once(&pred, ^
    {
        _object = [[KRAes alloc] init];
    });
    return _object;
}

-(instancetype)init
{
    self = [super init];
    if( self )
    {
        
    }
    return self;
}

/*
 * @ 加密
 *   - _key : your private key password with 32 Bytes
 */
-(NSData *)encryptAES256WithData:(NSData *)_data password:(NSString *)_key
{
    return [self _aes256WithData:_data key:_key isEncrypt:YES];
}

/*
 * @ 解密
 *   - _key : your private key password with 32 Bytes
 */
-(NSData *)decryptAES256WithData:(NSData *)_data password:(NSString *)_key
{
    return [self _aes256WithData:_data key:_key isEncrypt:NO];
}

@end




