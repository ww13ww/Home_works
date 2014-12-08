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
    UICollectionViewFlowLayout * layout =  (id) self.collectionView.collectionViewLayout;
    layout.itemSize = self.view.frame.size;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier: @"1"];
    
    self.pageControl.numberOfPages = 5;

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

-(bool) prefersStatusBarHidden {
    return YES;
}
//-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)orientation duration:(NSTimeInterval)duration
-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
 {
    [super viewDidLoad];
    UICollectionViewFlowLayout * layout =  (id) self.collectionView.collectionViewLayout;
    layout.itemSize = self.view.frame.size;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier: @"1"];
    
    self.pageControl.numberOfPages = 5;
     self.collectionView.contentOffset = CGPointZero;
     
    [self.collectionView reloadData];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell * cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"1" forIndexPath: indexPath];
    cell.backgroundColor = [UIColor colorWithRed:1.0f / (indexPath.row +1) green:1.0f / (indexPath.row +1) blue:1.0f / (indexPath.row +1) alpha: 1.0f];
    return cell;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.pageControl.currentPage = self.collectionView.contentOffset.x / self.collectionView.frame.size.width;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end












































