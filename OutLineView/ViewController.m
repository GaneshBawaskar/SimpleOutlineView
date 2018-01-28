//
//  ViewController.m
//  OutLineView
//
//  Created by Sabertooth on 25/01/18.
//  Copyright © 2018 Ganesh Bawaskar. All rights reserved.
//

#import "ViewController.h"
#import "FileSystemItem.h"

@implementation ViewController
@synthesize outlineView;
@synthesize array;
@synthesize model;
-(void)awakeFromNib{

    [self createItemList];
}

-(void)createItemList{
    if (!model) {
         model = [[ModelClass alloc] init];
        [model setItemName:@"Alphabets"];
       
        [model addChild:[ModelClass GetModelClass:@"AAA" date:@"05/05/2007" kind:@"Folder"]];
        [model addChild:[ModelClass GetModelClass:@"BBB" date:@"02/07/2014" kind:@"Folder"]];
        [model addChild:[ModelClass GetModelClass:@"CCC" date:@"02/07/2014" kind:@"Folder"]];
        [model addChild:[ModelClass GetModelClass:@"DDD" date:@"12/3/2017" kind:@"Folder"]];
        
        //
        [[model itemAtIndex:0] addChild:[ModelClass GetModelClass:@"A1" date:@"12/3/2017" kind:@"PDF Dodument"]];
        [[model itemAtIndex:0] addChild:[ModelClass GetModelClass:@"A2" date:@"02/07/2014" kind:@"Zip Archive"]];
        [[model itemAtIndex:0] addChild:[ModelClass GetModelClass:@"A3" date:@"01/02/2003" kind:@"PDF Document"]];
        [[model itemAtIndex:0] addChild:[ModelClass GetModelClass:@"A4" date:@"04/12/2016" kind:@"ZIP Archive"]];
        
        //
        [[model itemAtIndex:1] addChild:[ModelClass GetModelClass:@"B1" date:@"05/05/2007" kind:@"PDF Dodument"]];
        [[model itemAtIndex:1] addChild:[ModelClass GetModelClass:@"B2" date:@"03/01/1999" kind:@"JPG File"]];
        [[model itemAtIndex:1] addChild:[ModelClass GetModelClass:@"B3" date:@"02/07/2014" kind:@"Zip Archive"]];
        [[model itemAtIndex:1] addChild:[ModelClass GetModelClass:@"B4" date:@"12/3/2017" kind:@"PDF Dodument"]];
        
        //
        [[model itemAtIndex:2] addChild:[ModelClass GetModelClass:@"C1" date:@"12/3/2017" kind:@"PDF Dodument"]];
        [[model itemAtIndex:2] addChild:[ModelClass GetModelClass:@"C2" date:@"02/07/2014" kind:@"Zip Archive"]];
        [[model itemAtIndex:2] addChild:[ModelClass GetModelClass:@"C3" date:@"03/01/1999" kind:@"JPG File"]];
        [[model itemAtIndex:2] addChild:[ModelClass GetModelClass:@"C4" date:@"05/05/2007" kind:@"PDF Dodument"]];
        
        //
        [[model itemAtIndex:3] addChild:[ModelClass GetModelClass:@"D1" date:@"07/08/2002" kind:@"Folder"]];
        [[model itemAtIndex:3] addChild:[ModelClass GetModelClass:@"D2" date:@"03/05/2004" kind:@"ADOB File"]];
        [[model itemAtIndex:3] addChild:[ModelClass GetModelClass:@"D3" date:@"01/02/2003" kind:@"PDF Document"]];
        [[model itemAtIndex:3] addChild:[ModelClass GetModelClass:@"D4" date:@"04/12/2016" kind:@"ZIP Archive"]];
        
        [[[model itemAtIndex:3] itemAtIndex:0] addChild:[ModelClass GetModelClass:@"D11" date:@"12/3/2017" kind:@"PDF Dodument"]];
        [[[model itemAtIndex:3] itemAtIndex:0] addChild:[ModelClass GetModelClass:@"D111" date:@"20/4/1988" kind:@"MPEG-4"]];
        [[[model itemAtIndex:3] itemAtIndex:0] addChild:[ModelClass GetModelClass:@"D1111" date:@"05/05/2007" kind:@"PDF Dodument"]];
        [[[model itemAtIndex:3] itemAtIndex:0] addChild:[ModelClass GetModelClass:@"D111111" date:@"13/10/1987" kind:@"PNG File"]];
    }
   
        NSLog(@"child::%ld", [model childCount]);
}


-(void)viewWillAppear{
    
    NSTableColumn *column =  [outlineView tableColumnWithIdentifier:@"name"];
    [[column headerCell] setStringValue:@"Name"];
    
    [outlineView setDelegate:(id)self];
    [outlineView setDataSource:self];
    [outlineView reloadData];
    
}



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
    NSLog(@"%@ %@",tableColumn.identifier, itemName);
    NSTableCellView *view = [outlineView1 makeViewWithIdentifier:tableColumn.identifier owner:nil];
    if ([tableColumn.identifier isEqualToString:@"name"]) {
        [view.textField setStringValue:[Object getItemName]];
        [view.imageView setImage:[NSImage imageNamed:NSImageNameUserGroup]];
    }
    else if([tableColumn.identifier isEqualToString:@"date"]){
        [view.textField setStringValue:[Object getItemDate]];
    }
    else{
        [view.textField setStringValue:[Object getItemKind]];
    }
  
    /**/
    
    return view;
    
}

//- (nullable id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(nullable NSTableColumn *)tableColumn byItem:(nullable id)item
//{
//    NSString *itemName;
//    ModelClass *Object = (ModelClass *)item;
//    itemName = [Object getItemName];
//    return itemName;
//}
- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
