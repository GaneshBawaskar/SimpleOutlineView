//
//  FileSystemItem.h
//  OutLineView
//
//  Created by Sabertooth on 26/01/18.
//  Copyright © 2018 Ganesh Bawaskar. All rights reserved.
//

#ifndef FileSystemItem_h
#define FileSystemItem_h

@interface FileSystemItem : NSObject
{
    NSString *relativePath;
    FileSystemItem *parent;
    NSMutableArray *children;
}

+ (FileSystemItem *)rootItem;
- (NSInteger)numberOfChildren;// Returns -1 for leaf nodes
- (FileSystemItem *)childAtIndex:(NSUInteger)n; // Invalid to call on leaf nodes
- (NSString *)fullPath;
- (NSString *)relativePath;

@end
#endif /* FileSystemItem_h */
