//
//  FlowLayou.m
//  CollectionView
//
//  Created by CosyVan on 2016/11/19.
//  Copyright © 2016年 Aimmy. All rights reserved.
//

#import "FlowLayou.h"
/** 自定义流水布局用到的五个方法
 * - (void)prepareLayout;
 * - (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect;
 * - (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds;
 * - (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity;
 *  - (CGSize)collectionViewContentSize;
 */

@implementation FlowLayou


// 准备布局 计算cell的布局  第一次collection布局的时候调用，collection刷新的时候调用
//cell的位置是固定不变的时候在这里调用
- (void)prepareLayout
{
    [super prepareLayout];
}

// 作用：计算collectionView滚动范围
- (CGSize)collectionViewContentSize
{
    
    return [super collectionViewContentSize];
}

/** UICollectionViewLayoutAttributes: 确定cell的尺寸
 * 一个UICollectionViewLayoutAttributes对应一个cell，拿到这个就相当于拿到cell
 */

// 作用: 指定一段区域给你这段区域的cell的尺寸
//可以一次性发挥全部的cell尺寸
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    //1. 获取当前显示的区域
    
    // 1. 获取当前显示cell的布局
    NSArray *arr =  [super layoutAttributesForElementsInRect:self.collectionView.bounds];
    for (UICollectionViewLayoutAttributes *attr in arr) {
        //2.计算中心点距离
        CGFloat delta = fabs((attr.center.x - self.collectionView.contentOffset.x) - self.collectionView.bounds.size.width * 0.5);
        CGFloat scale = 1 - delta / (self.collectionView.bounds.size.width * 0.5) * 0.25;
        attr.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
    return arr;
}


// 在滚动的时候是否允许刷新布局 默认为 NO
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

// 什么时候调用：用户手指松开就会调用
// 确定最终的偏移量
// 定位:距离中心点越近,这个cell最终展示到中心点
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    // 拖动比较快 最终偏移量 不等于 手指离开时偏移量
    CGFloat collectionW = self.collectionView.bounds.size.width;
    
    //最终偏移量
    CGPoint targerP = [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
    
    //1. 获取最终显示的区域
    CGRect targerRect = CGRectMake(targerP.x, 0, collectionW, MAXFLOAT);
    
    //2. 最终显示的cell
    NSArray *attrs = [super layoutAttributesForElementsInRect:targerRect];
    
    // 获取最小间距
    CGFloat minDelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attr in attrs) {
        // 获取距离中心点距离:注意:应该用最终的x
        CGFloat delta = (attr.center.x - targerP.x) - self.collectionView.bounds.size.width * 0.5;
        if (fabs(delta) < fabs(minDelta)) {
            minDelta = delta;
        }
    }
    //移动间距
    targerP.x += minDelta;
    if (targerP.x < 0) {
        targerP.x = 0;
    }
    
    return targerP;
}





























@end
