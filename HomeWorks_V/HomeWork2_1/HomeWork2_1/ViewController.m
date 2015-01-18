//
//  ViewController.m
//  HomeWork2_1
//
//  Created by Viktoria on 17.01.15.
//  Copyright (c) 2015 Viktoria. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSURLConnectionDataDelegate>
@property (weak, nonatomic) IBOutlet UILabel *converterName;
@property (weak, nonatomic) IBOutlet UILabel *moneyText1;
@property (weak, nonatomic) IBOutlet UISegmentedControl *pickerMoneySell;
@property (weak, nonatomic) IBOutlet UILabel *moneyImputText;
@property (weak, nonatomic) IBOutlet UITextField *moneyImputField;
@property (weak, nonatomic) IBOutlet UILabel *moneyText2;
@property (weak, nonatomic) IBOutlet UISegmentedControl *pickerMoneyBuy;
@property (weak, nonatomic) IBOutlet UIButton *resultBtn;
@property (weak, nonatomic) IBOutlet UILabel *resultText;

@property (nonatomic, strong) NSURLConnection *connection;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString *urlString = @"https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5";
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    
//    connection = [NSURLConnection connectionWithRequest:request delegate:self];
//    [connection start];
}


//1// tap
- (IBAction)tapButton:(UIButton *)sender {
//    _tapButtonText.text = @"Button pressed";
}

- (IBAction)pickerMoneySell:(UISegmentedControl *)sender {
//    _tapFirstSecondText.text = [sender titleForSegmentAtIndex:(NSUInteger) sender.selectedSegmentIndex];
}

- (IBAction)pickerMoneyBuy:(UISegmentedControl *)sender {
    //    _tapFirstSecondText.text = [sender titleForSegmentAtIndex:(NSUInteger) sender.selectedSegmentIndex];
}

//3// imputText
- (BOOL)moneyImputField:(UITextField *)textField {
//    _textPlace.text = textField.text;
    return YES;
}


//- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
//{
//    NSLog(@"%@", response);
//}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
//    NSString *responce = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSError *e = nil;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
    
    if (!jsonArray) {
        NSLog(@"Error parsing JSON: %@", e);
    }
}

@end
