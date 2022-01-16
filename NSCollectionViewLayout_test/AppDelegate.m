//
//  AppDelegate.m
//  NSCollectionViewLayout_test
//
//  Created by Gregory Casamento on 6/14/21.
//

#import "AppDelegate.h"
#import "MyItem.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSCollectionView *collectionView;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

// Actions
- (IBAction)changeLayout:(id)sender {
}

// Datasource
- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath
{
    MyItem *item = [[MyItem alloc] init];
    
    item.title = [NSString stringWithFormat: @"%ld, %ld", indexPath.section, indexPath.item];

    return item;
}

// Delegate 

@end
