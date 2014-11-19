//
//  ViewController.m
//  HomeWork4_TableView
//
//  Created by admin on 19.11.14.
//  Copyright (c) 2014 Vika Vovk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource> {

}
@property (weak, nonatomic) IBOutlet UITableView *interfaceTable;
@property (strong, nonatomic) UITableView *codeTable;

@property (strong, nonatomic) NSArray *films;
@property (strong, nonatomic) NSArray *games;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // загрузилась вьюшка, можно с ней работать.
    _films = [[NSArray alloc] initWithObjects:@"Железный человек", @"Тор", @"Халк", @"Капитан Америка", @"Мстители", @"Человек паук", @"Автостопом по галактике", nil];
    _games = [[NSArray alloc] initWithObjects:@"Battlefield 4", @"Left 4 dead 2", @"Diablo 2", @"Unreal", @"Need For Speed: Most Wanted", @"Starcraft", @"Plants vs. Zombies", nil];
    
    // добавляем програмную
    [self addTableView];
}

- (void) addTableView {
    _codeTable = [[UITableView alloc] init];
    CGRect halfFrame = self.view.frame;
    halfFrame.size.height = halfFrame.size.height/1.9;
    halfFrame.origin.y = halfFrame.size.height;
    _codeTable.frame = halfFrame;
    _codeTable.dataSource = self;
    
    [self.view addSubview:_codeTable];
}

//возвращаем или фильмы или игры - смотря кому это надо
-(NSArray *) arrayForTableView: (UITableView *) table {
    if (table == _codeTable) {
        return _films;
    }
    return _games;
}

//возвращаем аррей относительно таблички которая спрашивает
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = [self arrayForTableView:tableView];
    return [array count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndex = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndex];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: cellIndex];
    }
// чтобы узнать что показывать - мы узнаем какая тейбл вю српашивает, и возвращаем селл
    NSArray *array = [self arrayForTableView:tableView];
    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.secl.ru/images/footer_eclipse.jpg"]]];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
