//
//  ModelClass.h
//  OutLineView
//
//  Created by Sabertooth on 27/01/18.
//  Copyright © 2018 Ganesh Bawaskar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelClass : NSObject
{
    NSMutableString *itemKind;
    NSMutableString *itemDate;
    NSMutableString *itemName;
    NSMutableArray *modelClassArray;
   
}
-(NSString *)getItemKind;
-(NSString *)getItemDate;
-(NSUInteger)childCount;
-(void)addChild:(ModelClass *)child;
-(void)removeChild:(ModelClass *)child;
-(ModelClass *)itemAtIndex:(NSUInteger)index;
-(void)setItemName:(NSString *)name;
-(NSString *)getItemName;
+(ModelClass *)GetModelClass:(NSString *)name date:(NSString *)date kind:(NSString *)kind;
@end
