//
//  WebServices.m
//  GDS WayFinder
//
//  Created by Openwave Computing on 9/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WebServices.h"

#import "OnDeck.h"
#import "HelpDesk.h"

#define PASS_KEY @"FBSJALWL3850JDNAJF93QKL403JJK53M"

@implementation WebServices

@synthesize webRequestMode;

#pragma mark - Singleton methods

+ (WebServices *)sharedInstance{
    static WebServices *sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    
    return sharedInstance;
}

#pragma mark - Compose Web Requests

- (void)composeWebRequestFromArguments:(NSMutableDictionary *)args forWebRequestMode:(WebRequestMode *)webReqMode responseWithStatus:(void(^)(NSMutableArray *))handler{
    
    NSString *webRequest;
    
    switch ((int)[WebServices sharedInstance].webRequestMode) {
            
       
            
        case WEB_REQUEST_SIGN_IN:{
            
            webRequest = [NSString stringWithFormat:@"device_token=%@&username=%@&password=%@&ltype=%@",
                          [args objectForKey:@"device_token"],
                          [args objectForKey:@"email"],
                          [args objectForKey:@"password"],
                          [args objectForKey:@"type"]];
        }
            break;
            break;
            
        case WEB_REQUEST_SIGN_UP:
            
        {
                    }
            break;
            
            
       
            
            
            
            
        default:
            break;
    }
    
    NSLog(@"Web Request = %@",webRequest);
    
    
    //Passing the web request string to get the encrypted data
    [[WebServices sharedInstance] composedWebRequest:webRequest dataAfterEncryption:^(NSData *encryptedData){
        
        //Post the encrypted data to get the response
        [[WebServices sharedInstance] postWebRequest:encryptedData responseFromServer:^(NSMutableDictionary *response){
            
            [[WebServices sharedInstance] getValuesFromResponse:response forWebRequestMode:[WebServices sharedInstance].webRequestMode withTheStatus:^(NSMutableArray *status){
                handler(status);
            }];
        }];
    }];
    
}

#pragma mark - Core Web Service Methods

- (void)composedWebRequest:(NSString *)webRequest dataAfterEncryption:(void(^)(NSData *))handler{
    
    
    NSData *postData = [webRequest dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    
    //Passes the encrypted data to the handler
    handler(postData);
}

- (void)postWebRequest:(NSData *)postData responseFromServer:(void(^)(NSMutableDictionary *))handler{
    
    NSURL *url;
    switch ((int)[WebServices sharedInstance].webRequestMode) {
            
       
            
            
        case WEB_REQUEST_SIGN_IN:
        {
            url = [NSURL URLWithString:@""];
            
        }
            break;
            
            
        default:
            break;
    }
    
    
    //Post method declaration
    NSLog(@"URL%@",url );
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10.0f];
    
    switch ((int)[WebServices sharedInstance].webRequestMode) {
            
            }
    
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    
    //NSLog(@"the request is == %@",request);
    //NSLog(@"the post data is == %@",postData);
    //NSLog(@"Request Posted = %@",[request allHTTPHeaderFields]);
    
    NSError *error = nil;
    NSURLResponse *response = nil;
    
    //Perform request and get JSON back as a NSData object
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    //Get JSON as a NSString from NSData response
    NSString *json_string = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    NSLog(@"JSON String as Response = %@", json_string);
    
    //Parse the JSON string into a dictionary
    //NSMutableDictionary *parsedResponse = [parser objectWithString:json_string error:nil];
    
    //Passes the response to the handler
    //handler(parsedResponse);
}

#pragma mark - Get Values into Dictionaries

- (void)getValuesFromResponse:(NSMutableDictionary*)withResponse forWebRequestMode:(WebRequestMode *)webReqMode withTheStatus:(void(^)(NSMutableArray *))handler{
    NSLog(@"withResponse = %@", withResponse);
    
    switch ((int)[WebServices sharedInstance].webRequestMode){
            
            
        case WEB_REQUEST_SIGN_IN:{
                    }
            break;
            
            
        default:
            break;
    }
}




@end