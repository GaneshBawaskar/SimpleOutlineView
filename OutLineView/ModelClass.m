//
//  ModelClass.m
//  OutLineView
//
//  Created by Sabertooth on 27/01/18.
//  Copyright © 2018 Ganesh Bawaskar. All rights reserved.
//

#import "ModelClass.h"

@implementation ModelClass

-(id)init {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    itemDate = [[NSMutableString alloc] init];
    itemKind = [[NSMutableString alloc] init];
    itemName = [[NSMutableString alloc] init];
    
    modelClassArray = [[NSMutableArray alloc] init];
    
    return  self;
}


+(ModelClass *)GetModelClass:(NSString *)name date:(NSString *)date kind:(NSString *)kind{
    ModelClass *modObj = [[ModelClass alloc] init];
    [modObj setItemName:name];
    [modObj setItemKind:kind];
    [modObj setItemDate:date];
    return modObj;
}


-(NSUInteger)childCount{
    return [modelClassArray count];
    
}


-(void)addChild:(ModelClass *)child{
    
    [modelClassArray addObject:child];
}


-(void)removeChild:(ModelClass *)child{
    
    [modelClassArray removeObject:child];
}

-(NSString *)getItemName{
    
    return itemName;
}

-(NSString *)getItemKind{
    
    return itemKind;
}

-(NSString *)getItemDate{
    
    return (NSString *)itemDate;
}

-(ModelClass *)itemAtIndex:(NSUInteger)index{
    
    if (index >= [self childCount] ) {
        return nil;
    }
    
    ModelClass *item = [modelClassArray objectAtIndex:index];
    return item;
}

-(void)setItemName:(NSString *)name{
    [itemName setString:name];
}

-(void)setItemDate:(NSString *)date{
    [itemDate setString:date];
}

-(void)setItemKind:(NSString *)kind{
    [itemKind setString:kind];
}
@end
