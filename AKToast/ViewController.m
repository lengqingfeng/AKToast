//
//  ViewController.m
//  AKToast
//
//  Created by 冷胜任 on 2017/7/13.
//  Copyright © 2017年 Alijk.com. All rights reserved.
//

#import "ViewController.h"
#import "AKToast.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(hidenTOst:) withObject:self afterDelay:5];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)tostTest:(id)sender {
    [AKToast showToastLoadingMsg:@"请稍等..."];
}
- (IBAction)hidenTOst:(id)sender {
    [AKToast hideToast];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
