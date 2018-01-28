//
//  ViewController.h
//  OutLineView
//
//  Created by Sabertooth on 25/01/18.
//  Copyright © 2018 Ganesh Bawaskar. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ModelClass.h"
@interface ViewController : NSViewController<NSOutlineViewDelegate, NSOutlineViewDataSource>
{
    ModelClass *model;
    NSArray *array;
    NSOutlineView *outlineView;
}
@property(retain) IBOutlet NSOutlineView *outlineView;
@property(retain) NSArray *array;
@property(retain)  ModelClass *model;
@end

