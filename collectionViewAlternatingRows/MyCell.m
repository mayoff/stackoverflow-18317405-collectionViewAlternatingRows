    /*
    Created by Rob Mayoff on 8/19/13.
    Copyright (c) 2013 Rob Mayoff. All rights reserved.
    */

    #import "MyCell.h"
    #import "MyLayoutAttributes.h"

    @interface MyCell ()

    @end

    @implementation MyCell

    - (void)applyLayoutAttributes:(MyLayoutAttributes *)pose {
        [super applyLayoutAttributes:pose];
        if (!self.backgroundView) {
            self.backgroundView = [[UIView alloc] init];
        }
        self.backgroundView.backgroundColor = pose.backgroundColor;
    }

    @end
