//
//  OSCPhotoAlbumManger.h
//  iosapp
//
//  Created by Graphic-one on 16/7/28.
//  Copyright © 2016年 oschina. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;

typedef void (^AlbumCompleteHanle)(NSError* error , BOOL isHasAuthorized);

/**
 * Download the pictures to the custom photo album
 * Usage : 
 * 1.Method (sharePhotoAlbumManger) is called for a singleton Object
 * 2.Using this object calls the save method(saveImage: albumName: completeHandle:)
 */
@interface GAPhotoAlbumManger : NSObject

/**
 *  The only way to create the object
 */
+ (instancetype) sharePhotoAlbumManger;

/**
 *  Use the singleton calls , download the photo albums to custom ... 
 *
 *  @param image          imageObject source data
 *  @param albumName      customize the name of the album (if not, is created...)
 *  @param completeHandle complete the callback
 */
- (void) saveImage:(UIImage* )image
         albumName:(NSString* )albumName
    completeHandle:(AlbumCompleteHanle)completeHandle;


+ (instancetype) new UNAVAILABLE_ATTRIBUTE;

@end
