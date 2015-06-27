//
//  TopicCell.m
//  SpeedNews
//
//  Created by lanou3g on 15/6/6.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "TopicCell.h"
#import "CustomCollectionViewCell.h"
#import "NetData.h"
#import "TVpalyViewController.h"


@implementation TopicCell

- (void)dealloc{
    
    [_TVarray release];
    [super dealloc];

}





- (instancetype)initWithStyle:(UITableViewCellStyle)style withSize:(CGSize)size reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
               
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        
        layout.itemSize = CGSizeMake(110, 100);
        
        CGFloat TVrowWith = size.width;
        CGFloat everItemW = (TVrowWith - 10)/3 - 20;
        
        layout.itemSize = CGSizeMake(everItemW , everItemW- 10);
        
        
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10);
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [self addSubview:collectionView];
        
        [collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"collectCell"];
              
        
        
    }
    return self;

}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
    
}





- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
     return self.numberItem;

}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectCell" forIndexPath:indexPath ];
    
   NetData *netData = [self.TVarray objectAtIndex:indexPath.item];
    
    cell.titleLabel.text = netData.title;
    cell.imgeStr = netData.thumbnail;
    return cell;



}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

NetData *netData = [self.TVarray objectAtIndex:indexPath.item];
    
    TVpalyViewController *top = [[TVpalyViewController alloc]init];
    top.netData = netData;
    top.imgeStr = netData.thumbnail;
      UIViewController *VC =[self viewController];
      [VC.navigationController pushViewController:top animated:YES];
    [top release];

}
    
    
- (UIViewController*)viewController
{
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}



@end
