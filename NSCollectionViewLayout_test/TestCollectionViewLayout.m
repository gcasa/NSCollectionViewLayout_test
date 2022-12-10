//
//  TestCollectionViewLayout.m
//  NSCollectionViewLayout_test
//
//  Created by Gregory Casamento on 10/5/22.
//

#import "TestCollectionViewLayout.h"

@implementation TestCollectionViewLayout

- (nullable NSCollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    double rfx = drand48();
    double rfy = drand48();
    double rfw = drand48();
    
    CGFloat x = [self collectionView].frame.size.width * rfx;
    CGFloat y = [self collectionView].frame.size.height * rfy;
    CGFloat s = 100 * rfw + 10.0;
    
    NSCollectionViewLayoutAttributes *attr = [[NSCollectionViewLayoutAttributes alloc] init];
    
    [attr setSize: NSMakeSize(s,s)];
    [attr setFrame: NSMakeRect(x,y, s, s)];
    [attr setAlpha: 1.0];
    [attr setHidden: NO];
    
    return attr;
}

- (NSSize)collectionViewContentSize
{
    return NSMakeSize(1000.0, 1000.0);
}

@end
