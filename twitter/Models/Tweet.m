//
//  Tweet.m
//  twitter
//
//  Created by Jessica Shu on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "Tweet.h"
#import "Datetools.h"

@implementation Tweet

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self){
        // Is this a re-tweet?
        NSDictionary *originalTweet = dictionary[@"retweeted_status"]; // contains original tweet that was retweeted
        if (originalTweet != nil){
            NSDictionary *userDictionary = dictionary[@"user"];
            self.retweetedByUser = [[User alloc] initWithDictionary:userDictionary];
            
        
            // Change tweet to original tweet
            dictionary = originalTweet;
        }
        
        self.idStr = dictionary[@"id_str"];
        self.text = dictionary[@"text"];
        self.favoriteCount = [dictionary[@"favorite_count"] intValue];
        self.favorited = [dictionary[@"favorited"] boolValue];
        self.retweetCount = [dictionary[@"retweet_count"] intValue];
        self.retweeted = [dictionary[@"retweeted"] boolValue];
        
        // TODO: initialize user
        NSDictionary *user = dictionary[@"user"];
        self.user = [[User alloc] initWithDictionary:user];
        
        // TODO: Format and set createdAtString
        // Format createdAt date string
        NSString *createdAtOriginalString = dictionary[@"created_at"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        // Configure the input format to parse the date string
        formatter.dateFormat = @"E MMM d HH:mm:ss X y";
        // Convert String to Date
        NSDate *date = [formatter dateFromString:createdAtOriginalString];
        // Convert output format
        formatter.dateStyle = NSDateFormatterShortStyle;
        formatter.timeStyle = NSDateFormatterNoStyle;
        // Convert Date to String
        if ([date daysAgo] > 7){
            self.createdAtString = [formatter stringFromDate:date];
        } else if ([date hoursAgo] > 24) {
            self.createdAtString = [NSString stringWithFormat:@"%.ldd",[date daysAgo]];
        } else if ([date minutesAgo] > 60) {
            self.createdAtString = [NSString stringWithFormat:@"%.fh",[date hoursAgo]];
        } else {
            self.createdAtString = [NSString stringWithFormat:@"%.fm",[date minutesAgo]];
        }
        


        
        
    }
    return self;
}

- (void)toggleFavorite{
    if (self.favorited){
        self.favorited = NO;
        self.favoriteCount -= 1;
    }
    else {
        self.favorited = YES;
        self.favoriteCount += 1;
    }
}

- (void)toggleRetweet{
    if (self.retweeted){
        self.retweeted = NO;
        self.retweetCount -= 1;
    }
    else {
        self.retweeted = YES;
        self.retweetCount += 1;
    }
}

+ (NSMutableArray *)tweetsWithArray:(NSArray *)dictionaries{
    NSMutableArray *tweets = [[NSMutableArray alloc] init];
    for (NSDictionary *dictionary in dictionaries){
        Tweet *tweet = [[Tweet alloc] initWithDictionary:dictionary];
        [tweets addObject:tweet];
    }
    return tweets;
    
}
    
@end
