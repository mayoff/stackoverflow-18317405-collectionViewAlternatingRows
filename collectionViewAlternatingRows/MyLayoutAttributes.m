    /*
    Created by Rob Mayoff on 8/19/13.
    Copyright (c) 2013 Rob Mayoff. All rights reserved.
    */

    #import "MyLayoutAttributes.h"

    @implementation MyLayoutAttributes

    - (instancetype)copyWithZone:(NSZone *)zone {
        MyLayoutAttributes *copy = [super copyWithZone:zone];
        copy.backgroundColor = self.backgroundColor;
        return copy;
    }

    @end
