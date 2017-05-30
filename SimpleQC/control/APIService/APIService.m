//
//  APIService.m
//  SimpleQC
//
//  Created by AnCheng on 30/05/2017.
//  Copyright © 2017 AnCheng. All rights reserved.
//

#import "APIService.h"

@implementation APIService

+ (id)sharedManager
{
    static APIService *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[super alloc] init];
    });
    return sharedManager;
}

+ (AFHTTPSessionManager*) manager
{
    static dispatch_once_t onceToken;
    static AFHTTPSessionManager *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
    });
    
    return manager;
}


- (void)authoLogin:(NSString *)userId password:(NSString *)password complete:(RequestCompletionHandler)complete
{
    AFHTTPSessionManager *manager = [APIService manager];
    AFJSONResponseSerializer *serialize = [AFJSONResponseSerializer serializer];
    serialize.acceptableContentTypes = [serialize.acceptableContentTypes setByAddingObject:@"text/html"];
    manager.responseSerializer = serialize;
    NSDictionary *parameters = @{@"user_id": userId ,@"password" : password};
    [manager POST:[NSString stringWithFormat:@"%@%@" , BASE_URL ,LOGIN] parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSLog(@"response: %@", responseObject);
        complete(responseObject ,nil);

        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        
        NSLog(@"Error: %@", error.localizedDescription);
        complete(nil ,error);
    }];
}

- (void)getProjectByPO:(NSString *)po complete:(RequestCompletionHandler1)complete
{
    AFHTTPSessionManager *manager = [APIService manager];
    AFJSONResponseSerializer *serialize = [AFJSONResponseSerializer serializer];
    serialize.acceptableContentTypes = [serialize.acceptableContentTypes setByAddingObject:@"text/html"];
    manager.responseSerializer = serialize;
    NSDictionary *parameters = @{@"po_number": po};
    [manager POST:[NSString stringWithFormat:@"%@%@" , BASE_URL ,SEARCH_BY_PO] parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSLog(@"response: %@", responseObject);
        if ([responseObject isKindOfClass:[NSArray class]])
            complete(responseObject ,nil);
        else
            complete(nil ,nil);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        
        NSLog(@"Error: %@", error.localizedDescription);
        complete(nil ,error);
    }];
}

- (void)getProjectByJob:(NSString *)job complete:(RequestCompletionHandler1)complete
{
    AFHTTPSessionManager *manager = [APIService manager];
    AFJSONResponseSerializer *serialize = [AFJSONResponseSerializer serializer];
    serialize.acceptableContentTypes = [serialize.acceptableContentTypes setByAddingObject:@"text/html"];
    manager.responseSerializer = serialize;
    NSDictionary *parameters = @{@"job_number": job};
    [manager POST:[NSString stringWithFormat:@"%@%@" , BASE_URL ,SEARCH_BY_JOB] parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSLog(@"response: %@", responseObject);
        if ([responseObject isKindOfClass:[NSArray class]])
            complete(responseObject ,nil);
        else
            complete(nil ,nil);
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        
        NSLog(@"Error: %@", error.localizedDescription);
        complete(nil ,error);
    }];
}

@end
