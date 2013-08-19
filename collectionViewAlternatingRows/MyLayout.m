    /*
    Created by Rob Mayoff on 8/19/13.
    Copyright (c) 2013 Rob Mayoff. All rights reserved.
    */

    #import "MyLayout.h"
    #import "MyLayoutAttributes.h"

    @implementation MyLayout

    + (Class)layoutAttributesClass {
        return [MyLayoutAttributes class];
    }

    - (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
        NSArray *poses = [super layoutAttributesForElementsInRect:rect];
        [self assignBackgroundColorsToPoses:poses];
        return poses;
    }

    - (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
        MyLayoutAttributes *pose = (MyLayoutAttributes *)[super layoutAttributesForItemAtIndexPath:indexPath];
        [self assignBackgroundColorsToPoses:@[ pose ]];
        return pose;
    }

    - (void)assignBackgroundColorsToPoses:(NSArray *)poses {
        NSArray *rowColors = self.rowColors;
        int rowColorsCount = rowColors.count;
        if (rowColorsCount == 0)
            return;

        UIEdgeInsets insets = self.sectionInset;
        CGFloat lineSpacing = self.minimumLineSpacing;
        CGFloat rowHeight = self.itemSize.height + lineSpacing;
        for (MyLayoutAttributes *pose in poses) {
            CGFloat y = pose.frame.origin.y;
            NSInteger section = pose.indexPath.section;
            y -= section * (insets.top + insets.bottom) + insets.top;
            y += section * lineSpacing; // Fudge: assume each prior section had at least one cell
            int row = floorf(y / rowHeight);
            pose.backgroundColor = rowColors[row % rowColorsCount];
        }
    }

    @end
