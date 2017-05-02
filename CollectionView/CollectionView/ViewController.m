//
//  ViewController.m
//  CollectionView
//
//  Created by CosyVan on 2016/11/19.
//  Copyright © 2016年 Aimmy. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCell.h"
#import "FlowLayou.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<UICollectionViewDataSource>

@end

@implementation ViewController
 static NSString * const ID = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    FlowLayou *layout = ({
       FlowLayou *layout = [[FlowLayou alloc] init];
        layout.itemSize = CGSizeMake(160, 160);
        //最小行间距
        layout.minimumLineSpacing = 50;
        //最小的item间距
        //    layout.minimumInteritemSpacing = 10;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        CGFloat margin = (ScreenW - 160) * 0.5;
        layout.sectionInset = UIEdgeInsetsMake(0, margin, 0, margin);
        layout;
    });
    
    UICollectionView *collectionView = ({
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor brownColor];
        collectionView.center = self.view.center;
        collectionView.bounds = CGRectMake(0, 0, self.view.frame.size.width, 200);
        [self.view addSubview:collectionView];
        collectionView.dataSource = self;
        collectionView.showsHorizontalScrollIndicator= NO;
        collectionView;
    });
    
    //    [collectionView registerClass:[UICollectionViewCell class]forCellWithReuseIdentifier:ID];
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([PhotoCell class]) bundle:nil] forCellWithReuseIdentifier:ID];
}

#pragma mark - 创建流水


#pragma mark -
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
//    cell.backgroundColor = [UIColor redColor];
    
    NSString *imageName = [NSString stringWithFormat:@"%ld",indexPath.row +1];
    cell.image = [UIImage imageNamed:imageName];
    
    return cell;
    
}


@end
