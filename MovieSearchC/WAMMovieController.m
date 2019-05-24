//
//  WAMMovieController.m
//  MovieSearchC
//
//  Created by Will morris on 5/24/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WAMMovieController.h"

@implementation WAMMovieController

+ (instancetype)shared {
    static WAMMovieController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [WAMMovieController new];
    });
    return shared;
}

- (void)searchMovieWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<WAMMovie*> * _Nullable))completion {
    NSURL *baseUrl = [NSURL URLWithString:@"https://api.themoviedb.org/3/search/movie"];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseUrl resolvingAgainstBaseURL:true];
    
    NSURLQueryItem *apiQuery = [NSURLQueryItem queryItemWithName:@"api_key" value:@"16697161ca27a4bcdb2b46d4e669b6ec"];
    NSURLQueryItem *searchQuery = [NSURLQueryItem queryItemWithName:@"query" value:searchTerm];
    
    components.queryItems = @[apiQuery, searchQuery];
    
    NSURL *finalUrl = [components URL];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        if (data) {
            NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            NSArray<NSDictionary *> *resultsArray = jsonDictionary[@"results"];
            NSMutableArray<WAMMovie *> *arrayOfMovies = [NSMutableArray new];
            for (NSDictionary *movieDictionary in resultsArray) {
                WAMMovie *movie = [[WAMMovie alloc] initWithDictionary:movieDictionary];
                [arrayOfMovies addObject:movie];
            }
            WAMMovieController.shared.movies = arrayOfMovies;
            completion(arrayOfMovies);
            return;
        }
        completion(nil);
        return;
    }] resume];
}

- (void)fetchImageAtUrlString:(NSString *)urlString completion:(void (^)(UIImage * _Nullable))completion {
    NSURL *baseUrl = [NSURL URLWithString:@"https://image.tmdb.org/t/p/w500"];
    NSURL *finalUrl = [baseUrl URLByAppendingPathComponent:urlString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            completion(image);
            return;
        }
    }] resume];
}

@end
