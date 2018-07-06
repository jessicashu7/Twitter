//
//  User.h
//  twitter
//
//  Created by Jessica Shu on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *screenName;
@property (strong, nonatomic) NSString *profileImageString;
@property (strong, nonatomic) NSString *bannerImageString;
@property (nonatomic) int following;
@property (nonatomic) int followers;
@property (nonatomic) int tweets;


-(instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end
