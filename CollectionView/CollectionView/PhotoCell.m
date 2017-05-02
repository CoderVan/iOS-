//
//  PhotoCell.m
//  CollectionView
//
//  Created by CosyVan on 2016/11/19.
//  Copyright © 2016年 Aimmy. All rights reserved.
//

#import "PhotoCell.h"

@interface PhotoCell()

@property (weak, nonatomic) IBOutlet UIImageView *photoImage;


@end

@implementation PhotoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    _photoImage.image = image;
}

@end
