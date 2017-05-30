//
//  APIService.h
//  SimpleQC
//
//  Created by AnCheng on 30/05/2017.
//  Copyright © 2017 AnCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIService : NSObject

+ (id)sharedManager;


/**
 Definition block
 
 @param result json result
 @param error error desscription
 */
typedef void(^RequestCompletionHandler)(NSDictionary *result,NSError *error);

/**
 Definition block
 
 @param result array result
 @param error error desscription
 */

typedef void(^RequestCompletionHandler1)(NSArray *result,NSError *error);

- (void)authoLogin:(NSString *)userId password:(NSString *)password complete:(RequestCompletionHandler)complete;
- (void)getProjectByPO:(NSString *)po complete:(RequestCompletionHandler1)complete;
- (void)getProjectByJob:(NSString *)job complete:(RequestCompletionHandler1)complete;

@end
