//
//  ViewController.m
//  AdSample
//
//  Created by tsuchii on 2014/04/22.
//  Copyright (c) 2014年 tsuchii. All rights reserved.
//

#import "ViewController.h"
#import "MyScene.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    SKScene * scene = [MyScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
    
    [appCCloud setDelegate:self];
    [appCCloud setupAppCWithMediaKey:@"794af50d3143a81b1be518cb9cb33be699d8f7d5"
                              option:APPC_CLOUD_AD];
}

- (void)finishedSetupAppC:(BOOL)succeed
{
    __block appCCutinView* cutin = [[appCCutinView alloc] initWithViewController:self closeBlock:^(id sender_) {
        [cutin removeFromSuperview];
    }];
    [self.view addSubview:cutin];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
