//
//  Character.m
//  Zend
//
//  Created by Anton Yakimenko on 17.11.14.
//  Copyright (c) 2014 HardCode. All rights reserved.
//

#import "Character.h"

@implementation Character

@synthesize type;
@synthesize speedX, speedY;
@synthesize runSpeed, jumpSpeed;
@synthesize platform;

- (Character *)cloneWithType:(CharacterType)cType atPosition:(CGPoint)position {
    return nil;
}

- (void)initPhysicsBody {
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.frame.size];
    self.physicsBody.restitution = 0;
    self.physicsBody.friction = 0.0;
    self.physicsBody.allowsRotation = NO;
    self.physicsBody.dynamic = YES;
}

-(id)initWithImageNamed:(NSString *)imageName {
    self = [super initWithImageNamed:imageName];
    if (self) {
        self.name   = @"Character";
        self.speedX = 0;
        self.speedY = 0;
        [self setDirection:0];
    }
    return self;
}

- (void)update {
    CGFloat platformSpeedX;
    if (platform != nil)
        platformSpeedX = platform.physicsBody.velocity.dx;
    else
        platformSpeedX = 0;
    self.physicsBody.velocity = CGVectorMake(self.speedX + platformSpeedX, self.physicsBody.velocity.dy);
}

- (void)run {
    isRunning = YES;
    speedX = runSpeed * direction;
}

- (void)stop {
    isRunning = NO;
    speedX = 0;
    self.physicsBody.velocity = CGVectorMake(0, self.physicsBody.velocity.dy);
}

- (void)jump {
    self.physicsBody.velocity = CGVectorMake(self.physicsBody.velocity.dx, self.jumpSpeed);
}

- (void)setDirection:(NSInteger)dir {
    direction = dir;
    if (dir > 0) {
        if (self.xScale < 0)
            self.xScale *= -1;
    }
    else if (dir < 0) {
        if (self.xScale > 0)
            self.xScale *= -1;
    }
}

@end
