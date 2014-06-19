//
//  KRAES.h
//  KRAES
//
//  Created by Kalvar on 2014/6/19.
//  Copyright (c) 2014年 Kalvar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KRAes : NSObject

+(instancetype)sharedAes;
-(instancetype)init;

-(NSData *)encryptAES256WithData:(NSData *)_data password:(NSString *)_key;
-(NSData *)decryptAES256WithData:(NSData *)_data password:(NSString *)_key;

@end
