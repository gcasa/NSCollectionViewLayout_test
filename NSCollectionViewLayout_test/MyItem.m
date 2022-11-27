//
//  MyItem.m
//  NSCollectionViewLayout_test
//
//  Created by Gregory Casamento on 1/16/22.
//

#import "MyItem.h"

@interface MyItem ()

@end

@implementation MyItem

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    NSLog(@"in viewDidLoad");
}

- (IBAction)itemAction:(id)sender
{
    NSLog(@"Action called %@, it should NOT be called", sender);
}

@end
