//
//  StartView.h
//  StartDemo
//
//  Created by 李斌 on 15/12/14.
//  Copyright © 2015年 李斌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartView : UIView

@property (nonatomic, strong) UIImage *notStartImage;
@property (nonatomic, strong) UIImage *selectImage;
@property (nonatomic, assign) BOOL  canEdit;
@property (nonatomic, assign) int maxRating;
@property (nonatomic, assign) int minSelectRating;
@property (nonatomic, assign) float rating;
@property (nonatomic, assign) CGSize minStarSize;
@property (nonatomic, assign) float midMargin;
@property (nonatomic, assign) float maxSelectRating;

+(CGSize)sizeForImage;

@end
