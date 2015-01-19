//
//  ViewController.m
//  HomeWork2_1
//
//  Created by Viktoria on 17.01.15.
//  Copyright (c) 2015 Viktoria. All rights reserved.
//
#import "Currencys.h"
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

NSString *inputCurrency1;
NSString *inputCurrency2;
NSString *inputText;
NSString *outputText;
NSArray *jsonArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getCurrencys];
//    [self performSelector:@selector(getCurrencys) withObject:nil afterDelay:2]
}

-(void) getCurrencys
{
    NSString *urlString = @"https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}


//- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
//{
//    NSLog(@"%@", response);
//}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSError *e = nil;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
    
    if (!jsonArray) {
        NSLog(@"Error parsing JSON: %@", e);
        [self getCurrencys];
        return;
    }
    
    NSMutableArray *currencies = [NSMutableArray array];
    for (NSDictionary *current in jsonArray) {
        Currencys *currencys = [Currencys new];
        [currencys setValuesForKeysWithDictionary:current];
        [currencies addObject:currencys];
    }
    
//    Currencys *currencys = currencies[1];
    NSString *a = jsonArray[1][@"base_ccy"];
    NSLog(@"Some Text___ %@", a);
    NSLog(@"%@",jsonArray);
}




//1// tap
- (IBAction)tapButton:(UIButton *)sender {
    //    _tapButtonText.text = @"Button pressed";
}

// picker
- (IBAction)pickerMoneySell:(UISegmentedControl *)sender {
    inputCurrency1 = [sender titleForSegmentAtIndex:(NSUInteger) sender.selectedSegmentIndex];
    NSLog(@"____%@", inputCurrency1);
//    NSLog(@"%@",jsonArray);
}

- (IBAction)pickerMoneyBuy:(UISegmentedControl *)sender {
    inputCurrency2 = [sender titleForSegmentAtIndex:(NSUInteger) sender.selectedSegmentIndex];
    NSLog(@"____%@", inputCurrency2);
}

//3// imputText
- (BOOL)moneyImputField:(UITextField *)textField {
    inputText = textField.text;
    return YES;
}

@end
