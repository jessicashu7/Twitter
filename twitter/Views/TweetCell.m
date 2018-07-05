//
//  TweetCell.m
//  twitter
//
//  Created by Jessica Shu on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"
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
    [self refreshData];
    
}

- (IBAction)didTapRetweet:(id)sender {
    [self.tweet toggleRetweet];
    [self refreshData];
}


- (IBAction)didTapFavorite:(id)sender {
    // TODO: Update the local tweet model
    [self.tweet toggleFavorite];
    // TODO: Update cell UI
    [self refreshData];
    // TODO: Send a POST request to the POST favorites/create endpoint
    if (self.tweet.favorited){
        [[APIManager shared] favoriteTweetWithCompletion:self.tweet completion:^(Tweet * tweet, NSError * error) {
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else {
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
    }
    else {
        [[APIManager shared] unfavoriteTweetWithCompletion:self.tweet completion:^(Tweet * tweet, NSError * error) {
            if(error){
                NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
            }
            else {
                NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
            }
        }];
    }
}

-(void)refreshData{
    self.userNameLabel.text = self.tweet.user.name;
    self.userScreenNameLabel.text = [NSString stringWithFormat:@"@%@", self.tweet.user.screenName];
    self.createdAtLabel.text = self.tweet.createdAtString;
    self.tweetTextLabel.text = self.tweet.text;
    // self.replyLabel =
    self.retweetCountLabel.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    self.favoriteCountLabel.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
    [self.profileImageView setImageWithURL:[NSURL URLWithString:self.tweet.user.profileImageString]];
    
    // favorite button
    if (self.tweet.favorited){
        [self.favoriteButton setSelected:YES];
    }
    else {
        [self.favoriteButton setSelected:NO];
    }
    
    // retweet button
    if (self.tweet.retweeted){
        [self.retweetButton setSelected:YES];
    }
    else {
        [self.retweetButton setSelected:NO];
    }

    // reply button
}
@end
