//
//  WAMMovie.m
//  MovieSearchC
//
//  Created by Will morris on 5/24/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

#import "WAMMovie.h"

@implementation WAMMovie

// Initialize a new movie object
- (instancetype)initWithTitle:(NSString *)title rating:(double)rating overview:(NSString *)overview imageUrl:(NSString *)imageUrl {
    self = [super init];
    if (self) {
        _title = title;
        _rating = rating;
        _overview = overview;
        _imageUrl = imageUrl;
    }
    return self;
}

// Use data from json dic and pass it to object initializer
- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary {
    NSString *titleFromJson = dictionary[@"title"];
    double ratingFromJson = [dictionary[@"vote_average"] integerValue];
    NSString *overviewFromJson = dictionary[@"overview"];
    NSString *imageUrlFromJson = dictionary[@"poster_path"];
    
    return [self initWithTitle:titleFromJson rating:ratingFromJson overview:overviewFromJson imageUrl:imageUrlFromJson];
}

@end
