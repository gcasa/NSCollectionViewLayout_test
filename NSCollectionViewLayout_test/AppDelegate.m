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
    
    NSLog(@"visitbleItems = %@", [self.collectionView visibleItems]);
    
    NSLog(@"GapIndicator = %@", NSCollectionElementKindInterItemGapIndicator);
    NSLog(@"Header = %@", NSCollectionElementKindSectionHeader);
    NSLog(@"Footer = %@", NSCollectionElementKindSectionFooter);
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
        NSCollectionViewFlowLayout *l = [[NSCollectionViewFlowLayout alloc] init];
        
        l.minimumLineSpacing = 10.0;
        l.itemSize = NSMakeSize(50.0, 50.0);
        layout = l;
    }
    else if (i == 1)
    {
        NSCollectionViewGridLayout *l = [[NSCollectionViewGridLayout alloc] init];

        l.maximumNumberOfRows = 5;
        l.maximumNumberOfColumns = 5;
        l.maximumItemSize = NSMakeSize(100.0, 100.0);
        l.minimumItemSize = NSMakeSize(50.0, 50.0);
        layout = l;
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
- (NSSet<NSIndexPath *> *)collectionView:(NSCollectionView *)collectionView shouldSelectItemsAtIndexPaths:(NSSet<NSIndexPath *> *)indexPaths
{
    NSLog(@"indexPaths = %@", indexPaths);
    return indexPaths;
}

@end
