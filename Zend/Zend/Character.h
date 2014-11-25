//
//  Character.h
//  Zend
//
//  Created by Anton Yakimenko on 17.11.14.
//  Copyright (c) 2014 HardCode. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Platform.h"

typedef enum {
    PLAYER,
    FRIEND,
    SZOMBIE,
    FZOMBIE
} CharacterType;

typedef enum {
    PLATFORM = 1,
    HUMAN    = 2,
    ZOMBIE   = 4
} BitMask;

@interface Character : SKSpriteNode {
    CharacterType type;
    CGFloat runSpeed, jumpSpeed;
    CGFloat speedX, speedY;
    NSInteger direction;
    BOOL isRunning, isJumping;
    Platform *platform;
}

@property CharacterType type;
@property CGFloat speedX, speedY;
@property CGFloat runSpeed, jumpSpeed;
@property Platform *platform;

- (Character *)cloneWithType:(CharacterType)cType atPosition:(CGPoint)position;
- (id)initWithImageNamed:(NSString *)imageName;
- (void)initPhysicsBody;
- (void)update;
- (void)run;
- (void)stop;
- (void)jump;
- (void)setDirection:(NSInteger)dir;

@end
