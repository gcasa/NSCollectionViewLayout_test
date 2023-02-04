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
#import "TestCollectionViewLayout.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property (strong) IBOutlet NSCollectionView *collectionView;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    srand48(time(0));
    
    NSLog(@"visitbleItems = %@", [self.collectionView visibleItems]);
    
    NSLog(@"GapIndicator = %@", NSCollectionElementKindInterItemGapIndicator);
    NSLog(@"Header = %@", NSCollectionElementKindSectionHeader);
    NSLog(@"Footer = %@", NSCollectionElementKindSectionFooter);
    
    self.arrayController.content = @[@"Test1", @"Test2", @"Test3", @"Test4"];
    
    NSLog(@"selectionIndexes: %@", self.collectionView.selectionIndexes);
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
    if (i == 0) // flow
    {
        NSCollectionViewFlowLayout *l = [[NSCollectionViewFlowLayout alloc] init];
        
        NSLog(@"Flow layout...");
        l.minimumLineSpacing = 10.0;
        l.itemSize = NSMakeSize(50.0, 50.0);
        layout = l;

        [self.collectionView setDelegate: self];
        [self.collectionView setDataSource: self];
    }
    else if (i == 1) // grid
    {
        NSCollectionViewGridLayout *l = [[NSCollectionViewGridLayout alloc] init];

        NSLog(@"Grid layout...");
        l.maximumNumberOfRows = 5;
        l.maximumNumberOfColumns = 5;
        l.maximumItemSize = NSMakeSize(100.0, 100.0);
        l.minimumItemSize = NSMakeSize(50.0, 50.0);
        layout = l;
        
        [self.collectionView setDelegate: self];
        [self.collectionView setDataSource: self];

    }
    else if (i == 2) // compositional
    {
        NSLog(@"Compositional layout...");
        [self.collectionView setDelegate: self];
        [self.collectionView setDataSource: self];
    }
    else if (i == 3) // custom
    {
        TestCollectionViewLayout *l = [[TestCollectionViewLayout alloc] init];

        NSLog(@"Custom layout...");
        layout = l;
        [self.collectionView setDelegate: self];
        [self.collectionView setDataSource: self];
    }
    else if (i == 4)
    {
        NSLog(@"Legacy/Array Content layout...");
        layout = nil;
        [self.collectionView setDelegate: nil];
        [self.collectionView setDataSource: nil];

        // self.collectionView.content
    }
    
    self.collectionView.collectionViewLayout = layout;
    // [self.collectionView layout];
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

- (void)collectionView:(NSCollectionView *)collectionView didSelectItemsAtIndexPaths:(NSSet<NSIndexPath *> *)indexPaths
{
    NSLog(@"selectionIndexes: %@", [self.collectionView selectionIndexes]);
    NSLog(@"selectionIndexPaths: %@", [self.collectionView selectionIndexPaths]);
}
@end
