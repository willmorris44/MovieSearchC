//
//  WAMMovieController.h
//  MovieSearchC
//
//  Created by Will morris on 5/24/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WAMMovie.h"

NS_ASSUME_NONNULL_BEGIN

@interface WAMMovieController : NSObject

@property (nonatomic, readwrite) NSArray<WAMMovie *> *movies;

+ (instancetype) shared;

- (void) searchMovieWithSearchTerm:(NSString*)searchTerm completion:(void (^) (NSArray<WAMMovie*> * _Nullable))completion;

- (void) fetchImageAtUrlString:(NSString*)urlString completion:(void (^) (UIImage * _Nullable))completion;

@end

NS_ASSUME_NONNULL_END
