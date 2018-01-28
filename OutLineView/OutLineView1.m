//
//  OutLineView1.m
//  OutLineView
//
//  Created by Sabertooth on 27/01/18.
//  Copyright © 2018 Ganesh Bawaskar. All rights reserved.
//

#import "OutLineView1.h"

@implementation OutLineView1

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}
/*
- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item {
    
    
    NSLog(@"numberOfChildrenOfItem::%@ %ld", item, [model childCount]);
    if (item == nil) {
        return [model childCount];
    }
    
    
    return [item childCount];
}


- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(nullable id)item{
    
    if (item == nil) {
        return [model itemAtIndex:index];
    }
    
    return [item itemAtIndex:index];
}


- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item{
    NSLog(@"IsItemExpandable::%@", item);
    ModelClass *Object = (ModelClass *)item;
    if ([Object childCount] > 0) {
        return true;
    }
    
    return false;
}
- (nullable NSView *)outlineView:(NSOutlineView *)outlineView1 viewForTableColumn:(nullable NSTableColumn *)tableColumn item:(id)item{
    
    NSString *itemName;
    ModelClass *Object = (ModelClass *)item;
    itemName = [Object getItemName];
    NSTableCellView *view = [outlineView1 makeViewWithIdentifier:tableColumn.identifier owner:nil];
    [view.textField setStringValue:itemName];
    NSLog(@"%@ %@",tableColumn.identifier, itemName);
    [view.imageView setImage:[NSImage imageNamed:NSImageNameUserGroup]];
    
    return view;
    
}*/

@end
