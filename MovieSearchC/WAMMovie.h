//
//  WAMMovie.h
//  MovieSearchC
//
//  Created by Will morris on 5/24/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WAMMovie : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic) double rating;
@property (nonatomic, copy) NSString *overview;
@property (nonatomic) NSInteger identifier;
@property (nonatomic, copy) NSString *imageUrl;

- (instancetype) initWithTitle:(NSString*)title rating:(double)rating overview:(NSString*)overview identifier:(NSInteger)identifier imageUrl:(NSString*)imageUrl;

- (instancetype) initWithDictionary:(NSDictionary<NSString*, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
