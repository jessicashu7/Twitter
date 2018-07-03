//
//  TweetCell.m
//  twitter
//
//  Created by Jessica Shu on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setTweet:(Tweet *)tweet{
    _tweet = tweet;
    
    self.userNameLabel.text = self.tweet.user.name;
    self.userScreenNameLabel.text = self.tweet.user.screenName;
    self.createdAtLabel.text = self.tweet.createdAtString;
    self.tweetTextLabel.text = self.tweet.text;
    // self.replyLabel =
    self.retweetCountLabel.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    self.favoriteCountLabel.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
    [self.profileImageView setImageWithURL:[NSURL URLWithString:self.tweet.user.profileImageString]];
    // self.replyButton =
    // self.retweetButton =
    // self.favoriteButton =

    
}

@end
