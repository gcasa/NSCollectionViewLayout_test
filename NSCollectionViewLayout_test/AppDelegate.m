//
//  AppDelegate.m
//  NSCollectionViewLayout_test
//
//  Created by Gregory Casamento on 6/14/21.
//

#import <AppKit/NSCollectionViewLayout.h>
#import <AppKit/NSCollectionViewGridLayout.h>
#import <AppKit/NSCollectionViewFlowLayout.h>

#import "AppDelegate.h"
#import "MyItem.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property (strong) IBOutlet NSCollectionView *collectionView;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification
{
    // Insert code here to tear down your application
}

// Actions
- (IBAction)changeLayout:(id)sender
{
    NSUInteger i = [sender indexOfSelectedItem];
    NSCollectionViewLayout *layout = nil;
    
    NSLog(@"Change layout %ld", i);
    if (i == 0)
    {
        layout = [[NSCollectionViewFlowLayout alloc] init];
    }
    else if (i == 1)
    {
        layout = [[NSCollectionViewGridLayout alloc] init];
    }
    else if (i == 2)
    {
    }
    else if (i == 3)
    {
        layout = nil;
    }
    
    self.collectionView.collectionViewLayout = layout;
    [self.collectionView layout];
}

// Datasource
- (NSInteger) collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (NSInteger) numberOfSectionsInCollectionView:(NSCollectionView *)collectionView
{
    return 2;
}

- (NSCollectionViewItem *) collectionView:(NSCollectionView *)collectionView
      itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath
{
    MyItem *item = [[MyItem alloc] init];
    
    item.title = [NSString stringWithFormat: @"%ld, %ld", [indexPath section], [indexPath item]];
    NSLog(@"title = %@ -- item = %@", item.title, item);
    
    return item;
}

// Delegate 

@end
