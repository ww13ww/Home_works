//
//  DeviceDetailControllerViewController.m
//  HomeWork6
//
//  Created by admin on 30.11.14.
//  Copyright (c) 2014 Vika Vovk. All rights reserved.
//

#import "DeviceDetailController.h"

@interface DeviceDetailController ()
{
    NSString *name;
}


@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation DeviceDetailController

- (void) setDeviceName: (NSString *) string {
    name = string;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label.text = name;
    
    NSString * urlString = [@"http:/en.wikipedia.org/wiki" stringByAppendingPathComponent:name];
    
    NSURL * url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [_webView loadRequest: request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
