//
//  GameManager.m
//  Demo_iOS设计模式之命令模式（1.原理分析）
//
//  Created by 项正强 on 2018/7/19.
//  Copyright © 2018年 项正强. All rights reserved.
//

#import "GameManager.h"

@interface GameManager ()

@property(nonatomic,strong)NSMutableArray *commands;

@property(nonatomic,strong)GameRecipient *recipient;

@property(nonatomic,strong)GameUpCommand *upCommand;

@property(nonatomic,strong)GameDownCommand *downCommand;

@property(nonatomic,strong)GameLeftCommand *leftCommand;

@property(nonatomic,strong)GameRightCommand *rightCommand;

@property(nonatomic,strong)GameFireCommand *fireCommand;
@end

@implementation GameManager

-(instancetype)initWithRecipient:(GameRecipient *)recipient UpCommand:(GameUpCommand *)up downCommand:(GameDownCommand *)down leftCommand:(GameLeftCommand *)left rightCommand:(GameRightCommand *)right fireCommand:(GameFireCommand *)fire{
    
    self = [super init];
    
    if (self) {
        
        _commands = [NSMutableArray arrayWithCapacity:0];
        
        _recipient = recipient;
        
        _upCommand = up;
        
        _downCommand = down;
        
        _leftCommand = left;
        
        _rightCommand = right;
        
        _fireCommand = fire;
        
    }
    
    return self;
}

-(void)up{
    //回调命令
    [self.upCommand operation];
    
    //保存命令
    [self.commands addObject:[[GameUpCommand alloc]initWithRecipient:self.recipient]];
}

-(void)down{
    
    [self.downCommand operation];
    
    [self.commands addObject:[[GameDownCommand alloc]initWithRecipient:self.recipient]];
}

-(void)left{
    
    [self.leftCommand operation];
    
    [self.commands addObject:[[GameLeftCommand alloc]initWithRecipient:self.recipient]];
}

-(void)right{
    
    [self.rightCommand operation];
    
    [self.commands addObject:[[GameRightCommand alloc]initWithRecipient:self.recipient]];
}

-(void)fire{
    
    [self.fireCommand operation];
    
    [self.commands addObject:[[GameFireCommand alloc]initWithRecipient:self.recipient]];
}


//撤销一个
-(void)undo{
    
    //倒序(队列->自己设计)
    if (self.commands.count > 0) {
        
        NSLog(@"撤销");
        
        //撤销
        [[self.commands lastObject] operation];
        
        //移除
        [self.commands removeLastObject];
    }
}

//撤销所有
-(void)undoAll{
    
    NSLog(@"撤销所有");
    
    //协议规范写法->语法规范
    for (id<GameCommandProtocol> command in self.commands) {
        
        [command operation];
        
    }
    
    [self.commands removeAllObjects];
}








@end













