//
//  Order.h
//  AlixPayDemo
//
//  Created by 方彬 on 11/2/13.
//
//

#import <Foundation/Foundation.h>

@interface AlipayOrder : NSObject

@property(nonatomic, copy) NSString * partner;
@property(nonatomic, copy) NSString * seller;
@property(nonatomic, copy) NSString * tradeNO;
@property(nonatomic, copy) NSString * productName;
@property(nonatomic, copy) NSString * productDescription;
@property(nonatomic, copy) NSString * amount;
@property(nonatomic, copy) NSString * notifyURL;

@property(nonatomic, copy) NSString * service;
@property(nonatomic, copy) NSString * paymentType;
@property(nonatomic, copy) NSString * inputCharset;
@property(nonatomic, copy) NSString * itBPay;
@property(nonatomic, copy) NSString * showUrl;
@property(nonatomic, copy) NSString * caseId;

@property(nonatomic, retain) NSDate * rsaDate;//可选
@property(nonatomic, copy) NSString * appID;//可选

@property(nonatomic, copy) NSString *username;
@property(nonatomic, copy) NSString *phoneNum;
@property(nonatomic, copy) NSString *address;

@property(nonatomic, readonly) NSMutableDictionary * extraParams;


@end
