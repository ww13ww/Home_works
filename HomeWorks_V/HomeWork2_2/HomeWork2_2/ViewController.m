//
//  ViewController.m
//  HomeWork2_2
//
//  Created by Viktoria on 31.01.15.
//  Copyright (c) 2015 Viktoria. All rights reserved.
//

#import "AuthorizationManager.h"
#import "ViewController.h"

@interface ViewController () <NSURLConnectionDataDelegate>

//@property (nonatomic, strong) NSURLConnection *connection;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self performSelectorInBackground:@selector(checkServerConnection) withObject: nil];
//    for (NSInteger i = 0; i<10; i++) {
//        AuthorizationManager *manager = [AuthorizationManager sharedManager];
//        NSLog(@"%@", manager);
///////////////    [[AuthorizationManager alloc] init];

//    NSLog(@"%@", [AuthorizationManager sharedManager].name);
//    }
//    [self getCurrencys];
    //    [self performSelector:@selector(getCurrencys) withObject:nil afterDelay:2]
}

-(void) checkServerConnection {
//    double delayInSeconds = 1.0;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        NSLog(@"Status - %i", [AuthorizationManager sharedManager].isServerReachable);
//    });
    
    for (NSInteger i = 0; i < INT_MAX; i++)
    {
        NSLog(@"Status - %i", [AuthorizationManager sharedManager].isServerReachable);
        [NSThread sleepForTimeInterval:1.0f];
    }
    [self checkServerConnection];

}

//-(void) getCurrencys
//{
//    NSString *urlString = @"https://api.flickr.com/services/feeds/photos_public.gne?format=json";
//    NSURL *url = [NSURL URLWithString:urlString];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
//}
//
//
//- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
//{
//    NSError *e = nil;
//    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
//    
//    if (!jsonArray)
//    {
//        NSLog(@"Error parsing JSON: %@", e);
//        [self getCurrencys];
//        return;
//    }
//    
//    NSMutableArray *currencies = [NSMutableArray array];
//    NSLog(@"%@", currencies);
////    for (NSDictionary *current in jsonArray) {
////        Currencys *currencys = [Currencys new];
////        [currencys setValuesForKeysWithDictionary:current];
////        [currencies addObject:currencys];
////        [currencys saveToUserDefaults];
////    }
//}


@end
