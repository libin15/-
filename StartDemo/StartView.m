//
//  StartView.m
//  StartDemo
//
//  Created by 李斌 on 15/12/14.
//  Copyright © 2015年 李斌. All rights reserved.
//

#import "StartView.h"
const int kMaxRating = 5;
const int kMinSelectRating = 0;
const float kMidMigin = 5;


@implementation StartView {
    
    NSMutableArray *_statsArray;
}



- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
         [self setData];
    }
    return self;
}

- (void)setData{
    _notStartImage = [UIImage imageNamed:@"not_selected_star"];
    _selectImage = [UIImage imageNamed:@"selected_star"];
    _statsArray = [[NSMutableArray alloc]init];
    _maxRating = kMaxRating;
    _maxSelectRating = kMaxRating;
    _minSelectRating = kMinSelectRating;
    _rating = _minSelectRating;
    _canEdit = YES;
    [self setUI];
}


- (void)setUI{
    for(int i = 0; i < _maxRating; ++i) {
      UIImageView *imageView = [[UIImageView alloc] init];
      imageView.contentMode = UIViewContentModeScaleToFill;
      [_statsArray addObject:imageView];
      [self addSubview:imageView];
    }
    [self refreshStars];
}


- (void)layoutSubviews {
     [super layoutSubviews];
      NSInteger count = _statsArray.count;
      if (count == 0) return;
      float desiredImageWidth = (self.frame.size.width - _statsArray.count * _midMargin)/_statsArray.count;
      CGFloat heigth = self.frame.size.height;
      for (int i = 0; i < _statsArray.count; ++i) {
        UIImageView *imageView = [_statsArray objectAtIndex:i];
        CGRect imageFrame = CGRectMake(i*(_midMargin+desiredImageWidth), 0, desiredImageWidth, heigth);
        imageView.frame = imageFrame;
    }
    
}

- (void)handleTouchAtLocation:(CGPoint)touchLocation {
    if (!_canEdit) return;
    
    _rating = 0;
    for(NSInteger i = _statsArray.count - 1; i >= 0; i--) {
        UIImageView *imageView = [_statsArray objectAtIndex:i];
        if (touchLocation.x > imageView.frame.origin.x) {
            _rating = i+1;
            break;
        }
    }
    _rating = MAX(_minSelectRating, _rating);
    _rating = MIN(_maxSelectRating, _rating);
    [self refreshStars];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    [self handleTouchAtLocation:touchLocation];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    [self handleTouchAtLocation:touchLocation];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    
    NSLog(@"_rating = %f",_rating);
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

   NSLog(@"_rating1 = %f",_rating);
}

- (void)refreshStars{
    
     for(int i = 0; i < _statsArray.count; ++i) {
        UIImageView *imageView = [_statsArray objectAtIndex:i];
        if (_rating >= i+1) {
            imageView.image = _selectImage;
        }else {
            imageView.image = _notStartImage;
        }
    }
}

+(CGSize)sizeForImage{

  UIImage *iamge = [UIImage imageNamed:@"not_selected_star"];
  CGFloat width = iamge.size.width * kMaxRating + 5* (kMaxRating - 1);
  CGSize size = CGSizeMake(width, iamge.size.height +3);
  return  size;
}


@end
