    //
    //  ViewController.m
    //  collectionViewAlternatingRows
    //
    //  Created by Rob Mayoff on 8/19/13.
    //  Copyright (c) 2013 Rob Mayoff. All rights reserved.
    //

    #import "ViewController.h"
    #import "MyCell.h"
    #import "MyLayout.h"

    @interface ViewController ()
    @property (strong, nonatomic) IBOutlet MyLayout *layout;
    @end

    @implementation ViewController

    - (void)viewDidLoad {
        [super viewDidLoad];

        self.layout.rowColors = @[
            [UIColor lightGrayColor],
            [UIColor cyanColor],
        ];
    }

    - (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
        return 10;
    }

    - (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
        return 11;
    }

    - (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
        MyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
        cell.label.text = [NSString stringWithFormat:@"%d:%d", indexPath.section, indexPath.item];
        return cell;
    }

    @end
