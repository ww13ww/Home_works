//
//  DetailViewController.h
//  HomeWork9_CoreData
//
//  Created by admin on 26.12.14.
//  Copyright (c) 2014 Vika Vovk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

