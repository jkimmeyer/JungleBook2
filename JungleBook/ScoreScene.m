//
//  ScoreScene.m
//  JungleBook
//
//  Created by Jo on 17.03.17.
//  Copyright © 2017 Johannes. All rights reserved.
//

#import "ScoreScene.h"
#import "MenuScene.h"
#import "GameData.h"


@implementation ScoreScene

-(void) didMoveToView:(SKView *)ScoreScene
{
    [self updateScore];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    // if next button touched, start transition to next scene
    if ([node.name isEqualToString:@"reset"]) {
        GameData *data = [GameData data];
        data.highscore = 0;
        data.middleScore =0;
        data.lowestScore =0;
        [data deleteAll];
        [self updateScore];

    } else if([node.name isEqualToString:@"back"]){
        MenuScene *menuScene = [[MenuScene alloc] initWithSize:self.size];
        SKTransition *transition = [SKTransition doorsCloseHorizontalWithDuration:1.5];
        [self.view presentScene:menuScene transition:transition];
    }
}

-(void)updateScore{
    GameData *data = [GameData data];
    [data load];
    SKLabelNode *highestScore = (SKLabelNode *)[self childNodeWithName: @"highScore"];
    highestScore.text = [NSString stringWithFormat:@"%i", data.highscore];
    SKLabelNode *secondScore = (SKLabelNode *)[self childNodeWithName:@"secondScore"];
    secondScore.text = [NSString stringWithFormat:@"%i",data.middleScore];
    SKLabelNode *thirdScore = (SKLabelNode *)[self childNodeWithName:@"thirdScore"];
    thirdScore.text = [NSString stringWithFormat:@"%i",(int) data.lowestScore];
}


@end
