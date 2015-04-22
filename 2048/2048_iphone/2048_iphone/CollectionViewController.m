//
//  CollectionViewController.m
//  2048_iphone
//
//  Created by admin on 06.04.15.
//  Copyright (c) 2015 Vika Vovk. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionCell.h"

#define ELEMENT_SPACING 10

@interface CollectionViewController () <UICollectionViewDataSource>
{
    NSArray *arrayCollectionImages;
    NSArray *countImages;
}
@property (nonatomic) BOOL useScoreView;
@property (nonatomic) NSUInteger threshold; // порог (2048)

@end

@implementation CollectionViewController

@synthesize swipeInfo;

static NSString * const reuseIdentifier = @"ReuseID";
//*******************************************
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.swipeInfo =nil;
}


- (void)viewDidLoad {
    
        arrayCollectionImages  = [[NSArray alloc] initWithObjects:@"2.png", @"4.png", @"8.png", @"16.png", @"32.png", @"64.png", @"128.png", @"256.png", @"512.png", @"1024.png", @"2048.png", @"backBig.png", nil];
    
    [super viewDidLoad];
    //[self setupGame];
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    //*********
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc]
                                           initWithTarget:self
                                           action:@selector(didSwipe:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc]
                                            initWithTarget:self
                                            action:@selector(didSwipe:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc]
                                         initWithTarget:self
                                         action:@selector(didSwipe:)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeUp];
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc]
                                           initWithTarget:self
                                           action:@selector(didSwipe:)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeDown];
    //*********
    
}
-(void)didSwipe:(UISwipeGestureRecognizer*)swipe{
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        swipeInfo.text = @"Left";
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        swipeInfo.text = @"Right";
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionUp) {
        swipeInfo.text = @"Up";
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionDown) {
        swipeInfo.text = @"Down";
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
   /* NSLog(@"%lu", arrayCollectionImages.count );
    NSInteger *a = arrayCollectionImages.count;
    NSLog(@"%i", a);
    
*/
    NSInteger numOfCells = 16;
    //return arrayCollectionImages.count;
    return numOfCells;
}
/*
- (void) allCells {
    
    static NSArray *allSectionColors = nil;
    
    if (allSectionColors == nil){
        allSectionColors = @[
                             [UIColor redColor],
                             [UIColor greenColor],
                             [UIColor blueColor],
                             ];
    }
    
   // return allSectionColors;
    
}*/

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
//    countImages
    
    //тут мы получаем колличество ячеек - и выбираем из них рандомных 2. и если это та
    //или иная ячейка - то рандомно ей ставим картинку!!! и куда-то мы должны записать это все чтобы обрабатывать
    //UIImageView *recipeImageview = (UIImageView *) [cell viewWithTag:120];
    //recipeImageview.image = [UIImage imageNamed:[arrayCollectionImages objectAtIndex:indexPath.row ]];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backBig.png" ]];
   // cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2048.png" ]];
    
    // Configure the cell
    return cell;
}

//#pragma mark <UICollectionViewDelegate>
/*
 -(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
 {
 CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ReuseID" forIndexPath:indexPath];
 [[cell collectionImageView] setImage:[UIImage imageNamed:[arrayCollectionImages objectAtIndex:indexPath.item]]];
 return  cell;
 
 }
 
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
/*
 - (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
 //#warning Incomplete method implementation -- Return the number of sections
 return 4;
 }*/


/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
