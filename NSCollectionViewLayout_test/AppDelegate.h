//
//  AppDelegate.h
//  NSCollectionViewLayout_test
//
//  Created by Gregory Casamento on 6/14/21.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, NSCollectionViewDataSource, NSCollectionViewDelegate>

@property (weak) IBOutlet NSArrayController *arrayController;

@end

