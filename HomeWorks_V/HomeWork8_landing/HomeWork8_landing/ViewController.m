//
//  ViewController.m
//  HomeWork8_landing
//
//  Created by admin on 08.12.14.
//  Copyright (c) 2014 Vika Vovk. All rights reserved.
//

#import "ViewController.h"


@interface ViewController() <UICollectionViewDataSource, UICollectionViewDelegate>
//@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>


@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIButton *regBtn;
@property (weak, nonatomic) IBOutlet UIButton *passBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier: @"1"];


}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell * cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"1" forIndexPath: indexPath];
    cell.backgroundColor = [UIColor colorWithRed:1.0f / (indexPath.row +1) green:1.0f / (indexPath.row +1) blue:1.0f / (indexPath.row +1) alpha: 1.0f];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end












































