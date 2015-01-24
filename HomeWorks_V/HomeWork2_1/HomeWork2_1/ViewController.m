//
//  ViewController.m
//  HomeWork2_1
//
//  Created by Viktoria on 17.01.15.
//  Copyright (c) 2015 Viktoria. All rights reserved.
//
#import "Currencys.h"
#import "ViewController.h"

@interface ViewController () <NSURLConnectionDataDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *converterName;
@property (weak, nonatomic) IBOutlet UILabel *moneyText1;
@property (weak, nonatomic) IBOutlet UISegmentedControl *pickerMoneySell;
@property (weak, nonatomic) IBOutlet UIButton *moneyImputBtn;
@property (weak, nonatomic) IBOutlet UILabel *moneyImputText;
@property (weak, nonatomic) IBOutlet UILabel *moneyText2;
@property (weak, nonatomic) IBOutlet UISegmentedControl *pickerMoneyBuy;
@property (weak, nonatomic) IBOutlet UIButton *resultBtn;
@property (weak, nonatomic) IBOutlet UILabel *resultText;

@property (nonatomic, strong) NSURLConnection *connection;
@end

@implementation ViewController

NSString *inputCurrency1;
NSString *inputCurrency2;
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


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSError *e = nil;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
    
    if (!jsonArray)
    {
        NSLog(@"Error parsing JSON: %@", e);
        [self getCurrencys];
        return;
    }
    
    NSMutableArray *currencies = [NSMutableArray array];
    for (NSDictionary *current in jsonArray) {
        Currencys *currencys = [Currencys new];
        [currencys setValuesForKeysWithDictionary:current];
        [currencies addObject:currencys];
        [currencys saveToUserDefaults];
    }
}


//1// tap
- (IBAction)moneyImputBtn:(UIButton *)sender {
        UIAlertView *pocket = [[UIAlertView alloc]
                               initWithTitle: @"Окно ввода"
                               message: @"Введите сумму"
                               delegate: self
                               cancelButtonTitle: @"Отмена"
                               otherButtonTitles: @"Принять", nil];
        
        pocket.alertViewStyle = UIAlertViewStylePlainTextInput;
        UITextField *textField = [pocket textFieldAtIndex:0];
        textField.keyboardType = UIKeyboardTypeNumberPad;
        [pocket show];
}


- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button Index =%i",buttonIndex);
    if (buttonIndex == 0)
    {
        NSLog(@"You have clicked Cancel");
    }
    else if(buttonIndex == 1)
    {
        NSLog(@"You have clicked Ok");
        NSString *taskText = [alertView textFieldAtIndex:0].text;
        
        if (![taskText isEqualToString:@""])
        {
            _moneyImputText.text =taskText;        }
    }
}


- (IBAction)tapButton:(UIButton *)sender {
    NSNumber *translate;
    CGFloat moneyText = [_moneyImputText.text floatValue];
    
    if (moneyText ==0)
    {
        _resultText.text = @"Вы не ввели сумму!";
        return;
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (!inputCurrency1)
    {
        inputCurrency1 =@"UAH";
        translate = @(moneyText);
    }
    else
    {
        NSDictionary *info = [defaults objectForKey:inputCurrency1];
        NSString *sale =[info valueForKey:@"sale"];
        CGFloat saleNumber = [sale floatValue];
        translate = @(saleNumber * moneyText);
        NSLog(@"____%@", translate);
    }
    if (!inputCurrency2)
    {
        inputCurrency2 =@"UAH";
        NSString * strResult = [translate stringValue];
        _resultText.text = strResult;
        return;
    }
    else
    {
        if (![inputCurrency2 isEqualToString:@"UAH"])
        {
            NSDictionary *info = [defaults objectForKey:inputCurrency2];
            NSString *buy =[info valueForKey:@"buy"];
            
            CGFloat buyNumber = [buy floatValue];
            float value = [translate floatValue];
            translate = @(buyNumber * value);
            NSString * strResult = [translate stringValue];
            _resultText.text = strResult;
        }
        else
        {
            NSString * strResult = [translate stringValue];
            _resultText.text = strResult;
            return;
        }
    }
}

// pickerS
- (IBAction)pickerMoneySell:(UISegmentedControl *)sender {
    inputCurrency1 = [sender titleForSegmentAtIndex:(NSUInteger) sender.selectedSegmentIndex];
}


- (IBAction)pickerMoneyBuy:(UISegmentedControl *)sender {
    inputCurrency2 = [sender titleForSegmentAtIndex:(NSUInteger) sender.selectedSegmentIndex];
}

@end
