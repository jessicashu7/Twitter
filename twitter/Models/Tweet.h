//
//  Tweet.h
//  twitter
//
//  Created by Jessica Shu on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Tweet : NSObject

// MARK: Properties
@property (nonatomic, strong) NSString *idStr;
@property (strong, nonatomic) NSString *text;
@property (nonatomic) int favoriteCount;
@property (nonatomic) BOOL favorited;
@property (nonatomic) int retweetCount;
@property (nonatomic) BOOL retweeted;
@property (strong, nonatomic) User *user;
@property (strong, nonatomic) NSString *createdAtString;

// For Retweets
@property (strong, nonatomic) User *retweetedByUser;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (void)toggleFavorite;

- (void)toggleRetweet;

+ (NSMutableArray *)tweetsWithArray:(NSArray *)dictionaries;


    
@end

