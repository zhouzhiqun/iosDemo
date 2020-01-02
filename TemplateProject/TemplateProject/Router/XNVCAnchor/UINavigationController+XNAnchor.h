//
//  UINavigationController+XNStack.h
//  
//
//  Created by zzc on 2018/10/7.
//  Copyright © 2018 zzc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XNStack.h"

@interface UINavigationController (XNAnchor)

//VC栈
@property (nonatomic, strong, readonly) XNStack *anchorStack;

@end


