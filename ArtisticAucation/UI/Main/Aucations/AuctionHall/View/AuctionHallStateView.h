//
//  AuctionHallStateView.h
//  ArtisticAuction
//
//  Created by xieran on 2017/4/25.
//  Copyright © 2017年 xieran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuctionHallStateView : UIView

@property(nonatomic,copy)void(^tapItemListBlock)(void);

- (IBAction)itemList:(id)sender;

@end