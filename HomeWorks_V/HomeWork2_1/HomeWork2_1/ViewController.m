//
//  ViewController.m
//  HomeWork2_1
//
//  Created by Viktoria on 17.01.15.
//  Copyright (c) 2015 Viktoria. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLConnectionDataDelegate>
@property (nonatomic, strong) NSURLConnection *connection;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString *urlString = @"https://query.yahooapis.com/v1/public/yql?q=select%20Bid%2CAsk%2CBidRealtime%2CAskRealtime%2CName%2CSymbol%20from%20yahoo.finance.quotes%20where%20symbol%20in%20(%22USDRUB%3DX%2CEURRUB%3DX%2CBZQ15.NYM%2CEURUAH%3DX%2CUSDUAH%3DX%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=";
//    NSString *urlString = @"https://api.privatbank.ua/p24api/pubinfo?exchange&coursid=5";
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    
//    connection = [NSURLConnection connectionWithRequest:request delegate:self];
//    [connection start];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"%@", response);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSString *responce = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}

@end
