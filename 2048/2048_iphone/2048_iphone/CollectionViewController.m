//
//  CollectionViewController.m
//  2048_iphone
//
//  Created by admin on 06.04.15.
//  Copyright (c) 2015 Vika Vovk. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionCell.h"
#import "ControlView.h"

#define ELEMENT_SPACING 10

@interface CollectionViewController () <UICollectionViewDataSource> //< ControlViewProtocol>  //GameModelProtocol
{
    NSArray *arrayCollectionImages;
    NSArray *countImages;
    
}
//@property (nonatomic, strong) GameboardView *gameboard;

//@property (nonatomic, strong) ControlView *controlView;

@property (nonatomic) BOOL useScoreView;
@property (nonatomic) BOOL useControlView;

@property (nonatomic) NSUInteger dimension; // размер 4 на 4
@property (nonatomic) NSUInteger threshold; // порог (2048)

@end

@implementation CollectionViewController

@synthesize swipeInfo;

static NSString * const reuseIdentifier = @"ReuseID";

/*+ (instancetype)numberTileGameWithDimension:(NSUInteger)dimension
                               winThreshold:(NSUInteger)threshold
                            backgroundColor:(UIColor *)backgroundColor
                                scoreModule:(BOOL)scoreModuleEnabled
                             buttonControls:(BOOL)buttonControlsEnabled
                              swipeControls:(BOOL)swipeControlsEnabled {
    CollectionViewController *c = [[self class] new];
    c.dimension = dimension > 2 ? dimension : 2;
    c.threshold = threshold > 8 ? threshold : 8;
    c.useScoreView = scoreModuleEnabled;
    c.useControlView = buttonControlsEnabled;
    c.view.backgroundColor = backgroundColor ?: [UIColor whiteColor];
    if (swipeControlsEnabled) {
        [c setupSwipeControls];
    }
    return c;
}*/
//******************************************
#pragma mark - Controller Lifecycle

/*- (void)setupSwipeControls {
    UISwipeGestureRecognizer *upSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                  action:@selector(upButtonTapped)];
    upSwipe.numberOfTouchesRequired = 1;
    upSwipe.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:upSwipe];
    
    UISwipeGestureRecognizer *downSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(downButtonTapped)];
    downSwipe.numberOfTouchesRequired = 1;
    downSwipe.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:downSwipe];
    
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(leftButtonTapped)];
    leftSwipe.numberOfTouchesRequired = 1;
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipe];
    
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                     action:@selector(rightButtonTapped)];
    rightSwipe.numberOfTouchesRequired = 1;
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipe];
}*/
//******************************************


/*- (void)setupGame {
    //F3HScoreView *scoreView;
    ControlView *controlView;
    
    CGFloat totalHeight = 0;
    
  */  // Set up score view
    /*if (self.useScoreView) {
        scoreView = [F3HScoreView scoreViewWithCornerRadius:6
                                            backgroundColor:[UIColor darkGrayColor]
                                                  textColor:[UIColor whiteColor]
                                                   textFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:16]];
        totalHeight += (ELEMENT_SPACING + scoreView.bounds.size.height);
        self.scoreView = scoreView;
    }
    */
    // Set up control view
   /* if (self.useControlView) {
        controlView = [ControlView controlViewWithCornerRadius:6
                                                  backgroundColor:[UIColor blackColor]
                                                  movementButtons:YES
                                                       exitButton:NO
                                                         delegate:self];
        totalHeight += (ELEMENT_SPACING + controlView.bounds.size.height);
        self.controlView = controlView;
    }*/
    
    // Create gameboard
    /*CGFloat padding = (self.dimension > 5) ? 3.0 : 6.0;
    CGFloat cellWidth = floorf((230 - padding*(self.dimension+1))/((float)self.dimension));
    if (cellWidth < 30) {
        cellWidth = 30;
    }*/
   /*GameboardView *gameboard = [F3HGameboardView gameboardWithDimension:self.dimension
                                                                 cellWidth:cellWidth
                                                               cellPadding:padding
                                                              cornerRadius:6
                                                           backgroundColor:[UIColor blackColor]
                                                           foregroundColor:[UIColor darkGrayColor]];
    totalHeight += gameboard.bounds.size.height;
    
    // Calculate heights
    CGFloat currentTop = 0.5*(self.view.bounds.size.height - totalHeight);
    if (currentTop < 0) {
        currentTop = 0;
    }
    
    if (self.useScoreView) {
        CGRect scoreFrame = scoreView.frame;
        scoreFrame.origin.x = 0.5*(self.view.bounds.size.width - scoreFrame.size.width);
        scoreFrame.origin.y = currentTop;
        scoreView.frame = scoreFrame;
        [self.view addSubview:scoreView];
        currentTop += (scoreFrame.size.height + ELEMENT_SPACING);
    }
    
    CGRect gameboardFrame = gameboard.frame;
    gameboardFrame.origin.x = 0.5*(self.view.bounds.size.width - gameboardFrame.size.width);
    gameboardFrame.origin.y = currentTop;
    gameboard.frame = gameboardFrame;
    [self.view addSubview:gameboard];
    currentTop += (gameboardFrame.size.height + ELEMENT_SPACING);
    
    if (self.useControlView) {
        CGRect controlFrame = controlView.frame;
        controlFrame.origin.x = 0.5*(self.view.bounds.size.width - controlFrame.size.width);
        controlFrame.origin.y = currentTop;
        controlView.frame = controlFrame;
        [self.view addSubview:controlView];
    }
    
    self.gameboard = gameboard;
    
    // Create mode;
    F3HGameModel *model = [F3HGameModel gameModelWithDimension:self.dimension
                                                      winValue:self.threshold
                                                      delegate:self];
    [model insertAtRandomLocationTileWithValue:2];
    [model insertAtRandomLocationTileWithValue:2];
    self.model = model;
*/
//}


/*
#pragma mark - Model Protocol

- (void)moveTileFromIndexPath:(NSIndexPath *)fromPath toIndexPath:(NSIndexPath *)toPath newValue:(NSUInteger)value {
    [self.gameboard moveTileAtIndexPath:fromPath toIndexPath:toPath withValue:value];
}

- (void)moveTileOne:(NSIndexPath *)startA tileTwo:(NSIndexPath *)startB toIndexPath:(NSIndexPath *)end newValue:(NSUInteger)value {
    [self.gameboard moveTileOne:startA tileTwo:startB toIndexPath:end withValue:value];
}

- (void)insertTileAtIndexPath:(NSIndexPath *)path value:(NSUInteger)value {
    [self.gameboard insertTileAtIndexPath:path withValue:value];
}

- (void)scoreChanged:(NSInteger)newScore {
    self.scoreView.score = newScore;
}


#pragma mark - Control View Protocol

- (void)upButtonTapped {
    [self.model performMoveInDirection:F3HMoveDirectionUp completionBlock:^(BOOL changed) {
        if (changed) [self followUp];
    }];
}

- (void)downButtonTapped {
    [self.model performMoveInDirection:F3HMoveDirectionDown completionBlock:^(BOOL changed) {
        if (changed) [self followUp];
    }];
}

- (void)leftButtonTapped {
    [self.model performMoveInDirection:F3HMoveDirectionLeft completionBlock:^(BOOL changed) {
        if (changed) [self followUp];
    }];
}

- (void)rightButtonTapped {
    [self.model performMoveInDirection:F3HMoveDirectionRight completionBlock:^(BOOL changed) {
        if (changed) [self followUp];
    }];
}

- (void)resetButtonTapped {
    [self.gameboard reset];
    [self.model reset];
    [self.model insertAtRandomLocationTileWithValue:2];
    [self.model insertAtRandomLocationTileWithValue:2];
}

- (void)exitButtonTapped {
    [self dismissViewControllerAnimated:YES completion:nil];
}*/
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
    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2048.png" ]];
    
    // Configure the cell
    return cell;
}


#pragma mark <UICollectionViewDelegate>
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
