//
//  WAMMovie.m
//  MovieSearchC
//
//  Created by Will morris on 5/24/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

#import "WAMMovie.h"

@implementation WAMMovie

- (instancetype)initWithTitle:(NSString *)title rating:(double)rating overview:(NSString *)overview identifier:(NSInteger)identifier imageUrl:(NSString *)imageUrl {
    self = [super init];
    if (self) {
        _title = title;
        _rating = rating;
        _overview = overview;
        _identifier = identifier;
        _imageUrl = imageUrl;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary {
    NSString *titleFromJson = dictionary[@"title"];
    double ratingFromJson = [dictionary[@"vote_average"] integerValue];
    NSString *overviewFromJson = dictionary[@"overview"];
    NSInteger identifierFromJson = [dictionary[@"id"] integerValue];
    NSString *imageUrlFromJson = dictionary[@"poster_path"];
    
    return [self initWithTitle:titleFromJson rating:ratingFromJson overview:overviewFromJson identifier:identifierFromJson imageUrl:imageUrlFromJson];
}

@end
