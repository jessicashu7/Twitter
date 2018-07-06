//
//  User.m
//  twitter
//
//  Created by Jessica Shu on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User

-(instancetype)initWithDictionary:(NSDictionary*)dictionary{
    self = [super init];
    if (self){
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        self.profileImageString = dictionary[@"profile_image_url_https"];
        self.bannerImageString = dictionary[@"profile_banner_url"];
        self.following = [dictionary[@"friends_count"] intValue];
        self.followers = [dictionary[@"followers_count"] intValue ];
        self.tweets = [dictionary[@"statuses_count"] intValue ];
    }
    return self;
    
}



@end
