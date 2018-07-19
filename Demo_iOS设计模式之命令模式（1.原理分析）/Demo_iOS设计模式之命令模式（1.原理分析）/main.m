//
//  main.m
//  Demo_iOS设计模式之命令模式（1.原理分析）
//
//  Created by 项正强 on 2018/7/19.
//  Copyright © 2018年 项正强. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GameManager.h"

#import "GameRecipient.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        //创建接收者
        GameRecipient *recipient = [[GameRecipient alloc]init];
        
        //创建操作命令(作用：解耦合)
        GameUpCommand *up = [[GameUpCommand alloc]initWithRecipient:recipient];
        
        GameDownCommand *down = [[GameDownCommand alloc]initWithRecipient:recipient];
        
        GameLeftCommand *left = [[GameLeftCommand alloc]initWithRecipient:recipient];
        
        GameRightCommand *right = [[GameRightCommand alloc]initWithRecipient:recipient];
        
        GameFireCommand *fire = [[GameFireCommand alloc]initWithRecipient:recipient];
        
        //创建请求者
        GameManager *manager = [[GameManager alloc]initWithRecipient:recipient UpCommand:up downCommand:down leftCommand:left rightCommand:right fireCommand:fire];
        
        //实现操作
        [manager up];
        
        [manager down];
        
        [manager left];
        
        [manager right];
        
        [manager fire];
        
        [manager undo];
        
        [manager undoAll];
        
    }
    return 0;
}














